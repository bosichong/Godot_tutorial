extends Node

# 声明一个带参数的自定义信号，参数类型是整数 (int)
signal score_updated(new_score: int)

var current_score = 0

func increase_score(points: int):
    current_score += points
    # 当分数改变时，发出信号，并附带新的分数值
    emit_signal("score_updated", current_score)


func _ready() -> void:
    increase_score(10) # ScoreLabel 显示 Score: 10
    await get_tree().create_timer(2.0).timeout  # 等待2秒
    increase_score(5)  # ScoreLabel 显示 Score: 15
    await get_tree().create_timer(2.0).timeout  # 等待2秒
    increase_score(5)  # ScoreLabel 显示 Score: 20
