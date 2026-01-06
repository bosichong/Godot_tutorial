extends Node2D
@onready var areas: Node = $areas


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    # 假设所有 Area2D 实例都放在一个叫 "Hazards" 的 Node 容器下
    for area in areas.get_children():
        if area.has_signal("player_entered"):
            area.player_entered.connect(_on_player_entered.bind(area))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass

const BoxScene = preload("res://box.tscn") # 导入场景
func _on_player_entered(area: Area2D):
    for i in range(5):
        var rand_x = randf() * 800.0
        var rand_y = randf() * -200
        var box = BoxScene.instantiate() # 场景实例化
        box.position = Vector2(rand_x, rand_y) # 定义位置标
        get_tree().current_scene.add_child(box) # 添加节点到场景的根目录main
