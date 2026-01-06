extends CharacterBody2D

@export var speed: float = 400.0
@export var jump_velocity: float = -600.0
@export var gravity: float = 800.0
## 推力强度
@export var push_force = 100.0

func _physics_process(delta):
    # 应用重力（仅当不在地面时）
    if not is_on_floor():
        velocity.y += gravity * delta

    # 水平移动
    var direction = 0
    if Input.is_action_pressed("move_right"):
        direction += 1
    if Input.is_action_pressed("move_left"):
        direction -= 1

    velocity.x = direction * speed
    

    # 跳跃
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_velocity
        
        
        # 检查玩家是否正在尝试左右移动
    if direction != 0:
        # 临时关闭玩家对“箱子层”的检测 (假设箱子在第3层)
        # 这会让玩家无视箱子的阻力直接走过去，而箱子会因为重力自然掉下
        set_collision_mask_value(3, false)
    else:
        # 停止移动时恢复检测，确保你还能站在箱子上或推它
        set_collision_mask_value(3, true)
    
    # 移动
    move_and_slide()
    
        # --- 推箱子核心代码 ---
    for i in get_slide_collision_count():
        var collision = get_slide_collision(i)
        var collider = collision.get_collider() # 返回碰撞的物体对象
        
        # 判断碰撞体是否为 RigidBody2D
        if collider is RigidBody2D:
            # 计算推力的方向（通常是碰撞法线的反方向）
            # apply_central_impulse 会施加一个瞬间的冲量
            collider.apply_central_impulse(collision.get_normal() * -push_force)
