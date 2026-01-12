extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 200 # 移动速度
const JUMP_VELOCITY = -800.0 #跳跃力
const GRAVITY = 1200.0 #重力

# 攻击状态
var is_attack = false
const ATTACK_DURATION = 1 # 攻击动画持续时间（秒）

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.

func _physics_process(delta: float) -> void:
    #因为需要跳跃，有物理需求，所以使用这个方法。
    
    # 应用重力
    if not is_on_floor():
        velocity.y += GRAVITY * delta #添加重力
    else:
        velocity.y = 0  # 防止在地面时 y 速度累积
    
    if not is_attack:
        if Input.is_action_just_pressed("attack"):
            _start_attack()
    
    if is_attack:
        velocity.x =0
    else:
        var direction = Input.get_axis("left", "right") # 获取移动方向
        velocity.x = direction * SPEED #根据方向进行动
        
        if Input.is_action_just_pressed("jump") and is_on_floor(): #表示地板上
            velocity.y = JUMP_VELOCITY
    
    # 面向左右（翻转 animated_sprite_2d）
    if velocity.x > 0:
        animated_sprite_2d.flip_h = false # 翻转动画播放
    elif velocity.x < 0:
        animated_sprite_2d.flip_h = true
        
    _update_animation() # 播放动画
    
    move_and_slide() # 安全移动并处理碰撞
    

## 播放动画
func _update_animation():
    var anim = "idle"
    
    if is_attack:
        anim = "attack"
    elif not is_on_floor():
        anim = "jump"
    elif velocity.x !=0: #非静止时播放 run
        anim = "run" 
    else:
        anim = "idle" # 静止的时候播放 idle
    
    animated_sprite_2d.play(anim)

func _start_attack():
    is_attack = true
    animated_sprite_2d.play("attack")
    # 攻击结束后自动结束状态
    await get_tree().create_timer(ATTACK_DURATION).timeout # 等待动画播放完毕
    is_attack = false
