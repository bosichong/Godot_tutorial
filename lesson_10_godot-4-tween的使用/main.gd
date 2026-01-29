extends Node2D
@onready var sprite_2d: Sprite2D = $Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var tween =create_tween()
    tween.set_trans(Tween.TRANS_BACK) #过渡
    tween.set_ease(Tween.EASE_IN) #缓动
    tween.tween_property(sprite_2d,'position',Vector2(700,240),1.0)
    


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
