extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass


func _on_button_pressed() -> void:
    # 这里就是按钮点后会执行代码的地方
    
    self.text = "按钮被点击啦！！！！！"
