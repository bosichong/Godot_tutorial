extends Node2D


# 当节点首次进入场景树时调用。
func _ready() -> void:
    # 代码会写在这里进行演示、
    #print("整数 3: ", 3)
    #print("浮点数 3.14: ", 3.14)
    #print("整数除法 5 / 2: ", 5 / 2)
    #print("除法 5.0 / 2: ", 5.0 / 2)
    #print("模除 7 % 3: ", 7 % 3)
    #print("幂运算 2**4: ", 2**4)
    
    
    #print("True: ", true)
    #print("False: ", false)
    #print("not True: ", not true)
    #print("True and False: ", true and false)
    #print("True or False: ", true or false)
    #
    #
    #print("字符串的连接:","你好"+"世界！")
    
    
    #var my_score = 100
    #var player_name = "Player1"
    #print("玩家分数: ", my_score)
    #print("玩家名: ", player_name)
    ## 变量的值可以改变
    #my_score = 150
    #print("更新后的分数: ", my_score)
    
    
    #
    #var inventory = ["Sword", "Shield", "Potion"]
    #print("初始背包: ", inventory)
    ## 添加物品
    #inventory.append("Helmet")
    #print("添加头盔后: ", inventory)
    ## 访问特定物品 (索引从 0 开始)
    #print("第一件物品: ", inventory[0]) # 输出 "Sword"
    ## 修改物品
    #inventory[2] = "Health Potion" # 将 "Potion" 改为 "Health Potion"
    #print("修改后背包: ", inventory)
    ## 获取数组长度
    #print("背包容量: ", inventory.size())
    #
    #
    
    
    #var player_stats = {
        #"health": 100,
        #"mana": 50,
        #"level": 5
    #}
    #print("初始状态: ", player_stats)
    ## 访问值
    #print("当前生命值: ", player_stats["health"])
    ## 添加或修改值
    #player_stats["speed"] = 10
    #player_stats["health"] = 90
    #print("更新后状态: ", player_stats)
    ## 检查键是否存在
    #print("是否有经验值? ", "exp" in player_stats) # 输出 false
    
    
    
    ## 调用我们自定义的函数
    #greet_player("Alice")
    #var result = calculate_damage(50, 10)
    #print("造成的伤害是: ", result)
    
    #var player_health = 20
    #if player_health <= 0:
        #print("Game Over!")
    #elif player_health < 30:
        #print("生命危险！请小心！")
    #else:
        #print("状态良好！")
        
        
    #var enemies = ["Goblin", "Orc", "Dragon"]
    #print("遭遇敌人:")
    #for enemy in enemies: # 遍历数组
        #print(" - ", enemy)
#
    #var scores = {"Player1": 100, "Player2": 85, "Player3": 120}
    #print("排行榜:")
    #for player_name in scores: # 遍历字典的键
        #print(player_name, ": ", scores[player_name])
    
    
    var level_num = 5
    var level_str = str(level_num) # 将数字转为字符串
    print("当前关卡: Level " + level_str) # 现在可以连接了

    var score_str = "1000"
    var score_num = int(score_str) # 将字符串转为整数
    print("得分翻倍: ", score_num * 2)
    
    
    
    
    
    
    


# 自定义函数：打招呼
func greet_player(player_name):
    print("你好, " + player_name + "! 欢迎来到游戏世界!")

# 自定义函数：计算伤害
func calculate_damage(base_attack, armor):
    var final_damage = base_attack - armor
    # 确保伤害不会是负数
    if final_damage < 0:
        final_damage = 0
    return final_damage # 返回计算结果
    


# 每一帧都会调用。'delta' 是自上一帧以来经过的时间（以秒为单位）。
func _process(delta: float) -> void:
    pass
