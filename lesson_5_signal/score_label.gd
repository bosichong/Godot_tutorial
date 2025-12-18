extends Label
@onready var score_manager: Node2D = $".." #连接到场景中的根节点ScoreManager


func _ready():
    # 在 _ready 函数中连接信号
    # 当 score_manager 发出 score_updated 信号时，执行 _on_score_manager_score_updated
    score_manager.score_updated.connect(_on_score_manager_score_updated)

# 这是我们响应信号的函数
func _on_score_manager_score_updated(new_score: int):
    # 更新 Label 的文本，显示新的分数
    self.text = "Score: " + str(new_score)
    #self 就是label 自己，text 是label的文本属性，修改以改变文本容
