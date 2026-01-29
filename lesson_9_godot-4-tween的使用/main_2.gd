extends Node2D

# 使用 Godot 的默认图标作为演示物体
var icon_texture = preload("res://icon.svg")

# 定义我们要演示的配置组合
var setups = [
    {"name": "Linear", "trans": Tween.TRANS_LINEAR, "ease": Tween.EASE_IN_OUT},
    {"name": "Sine Out", "trans": Tween.TRANS_SINE, "ease": Tween.EASE_OUT},
    {"name": "Back Out", "trans": Tween.TRANS_BACK, "ease": Tween.EASE_OUT},
    {"name": "Bounce Out", "trans": Tween.TRANS_BOUNCE, "ease": Tween.EASE_OUT},
    {"name": "Elastic Out", "trans": Tween.TRANS_ELASTIC, "ease": Tween.EASE_OUT},
    {"name": "Quint In", "trans": Tween.TRANS_QUINT, "ease": Tween.EASE_IN}
]

func _ready():
    # 为每种配置创建一个演示行
    for i in range(setups.size()):
        create_demo_row(i, setups[i])

func create_demo_row(index, config):
    # 1. 创建并添加精灵
    var sprite = Sprite2D.new()
    sprite.texture = icon_texture
    sprite.scale = Vector2(0.5, 0.5)
    sprite.position = Vector2(100, 100 + index * 100)
    add_child(sprite)
    
    # 2. 创建并添加标签文字
    var label = Label.new()
    label.text = config["name"]
    label.position = Vector2(20, 70 + index * 100)
    add_child(label)
    
    # 3. 启动循环动画函数
    animate_sprite(sprite, config)

func animate_sprite(sprite, config):
#    图标的起始和结束的坐标
    var start_pos = Vector2(100, sprite.position.y)
    var end_pos = Vector2(1000, sprite.position.y)
    
    # 创建 Tween
    var tween = create_tween().set_loops() # 无限循环
    
    # 设置当前行的过渡和缓动参数
    tween.set_trans(config["trans"])
    tween.set_ease(config["ease"])
    
    # 动画序列：移动到右边 -> 等待 -> 瞬移回左边
    tween.tween_property(sprite, "position", end_pos, 2.0)
    tween.tween_interval(0.5)  #间隔时间
    tween.tween_property(sprite, "position", start_pos, 0.0) # 瞬移回起始点
    tween.tween_interval(0.5)
