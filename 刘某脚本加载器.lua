--因为我没用过，好像就是界面在前面，后面的控件都跟着上一个界面

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/VeaMSRZK"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "Test"
LBL.TextColor3 = Color3.new(155, 155, 155)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("牛魔时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end

OrionLib:MakeNotification({
                    Name = "正在开启反挂机请稍等...",
                    Content = "AKF开启中...",
                    Time = 2
                })     
                
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:connect(function()
		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		   wait(1)
		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		end)      

OrionLib:MakeNotification({
                    Name = "开启成功",
                    Content = "AKF",
                    Time = 1
                })
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "刘某脚本", HidePremium = false, SaveConfig =true,IntroText="加载刘某脚本中", ConfigFolder = "文件存放名"})
local Tab = Window:MakeTab({-- T ad相当于一个id
	Name = "主页",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("作者","刘某")
Tab:AddParagraph("一眼鸡","❤️❤️❤️")
Tab:AddParagraph("温馨提示","墨水游戏脚本请先在其他游戏复制然后自行加载")

Tab:AddButton ({--这个就相当于一个按钮
	Name = "复制群",
	Callback = function ()
	 setclipboard("母前还没有")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制请在粘贴板中查看",
                    Time = 2
                })
	end
})

local Tab = Window:MakeTab({
	Name = "通用",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddSlider({--拉动条

	Name = "速度",

	Min = 16,--最小

	Max = 200,--最大值

	Default = 16,--当兼

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",--输入框的内容

	Callback = function(Value)
--这里填脚本↓
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value--这是一个变量，也就是当前框的值

	end    

})
Tab:AddSlider({

	Name = "跳跃高度",

	Min = 50,

	Max = 200,

	Default = 50,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end    

})
Tab:AddTextbox({

	Name = "移动速度设置",--这是一个输入框示例

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		
		OrionLib:MakeNotification({
                    Name = "成功设置速度:  "..game.Players.LocalPlayer.Character.Humanoid.WalkSpeed.."   |速度",
                    Content = "成功",
                    Time = 3
                })--也就相当于官方的一种提示框
	end
})
Tab:AddTextbox({
	Name = "重力设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Workspace.Gravity = Value
		
		OrionLib:MakeNotification({
                    Name = "成功设置重力:  "..game.Workspace.Gravity.."   |重力",
                    Content = "成功",
                    Time = 3
                })
	end
})
Tab:AddTextbox({
	Name = "跳跃高度设置",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
		
		OrionLib:MakeNotification({
                    Name = "成功设置跳跃高度:  "..game.Players.LocalPlayer.Character.Humanoid.WalkSpeed.."   |高度",
                    Content = "成功",
                    Time = 3
                })
	end
})

local Section = Tab:AddSection({
	Name = "以下为通用功能"
})

Tab:AddToggle({--这是一个开关
	Name = "夜视",
	Default = false,
	Callback = function(Value)
		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)		    		    

		end
--这里有一个判定
	end	
})

Tab:AddToggle({--一样
	Name = "穿墙",
	Default = false,--初始值  true  或 false
	Callback = function(Value)
		if Value then
		    Noclip = true
		    Stepped = game.RunService.Stepped:Connect(function()
			    if Noclip == true then
				    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
			    else
				    Stepped:Disconnect()
			    end
		    end)
	    else
		    Noclip = false
	    end
	end
})

Tab:AddButton({
  Name = "飞行",
  Callback = function()--再次新建类
  loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%ACV3(%E5%85%A8%E6%B8%B8%E6%88%8F%E9%80%9A%E7%94%A8)%20(1).txt"))()
  end
})

local Tab = Window:MakeTab({
	Name = "死铁轨",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("红叶汉化提示","先点上面的在点下面")

Tab:AddButton({
  Name = "红叶汉化",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/liuliuqiang404-code/-/refs/heads/main/%E7%BA%A2%E5%8F%B6%E6%B1%89%E5%8C%96"))()
  end
})

Tab:AddButton({
  Name = "红叶汉化",
  Callback = function()
  script_key="这里填你的卡密";
(loadstring or load)(game:HttpGet("https://getnative.cc/script/loader"))()
  end
})

Tab:AddButton ({--这个就相当于一个按钮
	Name = "复制红叶解卡1",
	Callback = function ()
	 setclipboard("https://ads.luarmor.net/get_key?for=Native_Lootlabs-hgTHxCASTxVE")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制请在粘贴板中查看",
                    Time = 2
                })
	end
})

Tab:AddButton ({--这个就相当于一个按钮
	Name = "复制红叶解卡2",
	Callback = function ()
	 setclipboard("https://ads.luarmor.net/get_key?for=Native_Linkvertise-OlHmNGrpKcxc")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制请在粘贴板中查看",
                    Time = 2
                })
	end
})

Tab:AddParagraph("红叶","红叶到这就完了")

Tab:AddButton({
  Name = "v5刷债券(需解卡)",
  Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader'))()
  end
})

Tab:AddParagraph("v5","多游戏通用")

Tab:AddParagraph("v5","其中包括99夜")

Tab:AddButton ({--这个就相当于一个按钮
	Name = "复制",
	Callback = function ()
	 setclipboard("瓦孓🐔里烟落癶😱")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制请在粘贴板中查看",
                    Time = 2
                })
	end
})

Tab:AddParagraph("有想要的脚本在q群","@我我就会填加进来")

local Tab = Window:MakeTab({
	Name = "99夜",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "虚空汉化",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/voidware-cn.txt"))()
  end
})

Tab:AddButton({
  Name = "99无敌脚本",
  Callback = function()--再次新建类
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/森林中的99夜.lua"))()
  end
})

local Tab = Window:MakeTab({
	Name = "doors",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
  Name = "doors汉化",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/VelocityX.lua"))()
  end
})

Tab:AddButton ({--这个就相当于一个按钮
	Name = "复制卡密",
	Callback = function ()
	 setclipboard("VelocityXFreeDoorsKey")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制请在粘贴板中查看",
                    Time = 2
                })
	end
})

Tab:AddButton({
  Name = "doors汉化2",
  Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/atnew2025/Chinese-scripts/refs/heads/main/mshax(prohax).txt"))()
  end
})

Tab:AddButton({
  Name = "MSdoors汉化",
  Callback = function()
  loadstring(game:HttpGet("https://www.msdoors.xyz/script"))()
  end
})

Tab:AddParagraph("ms","一章二章皆可用")

local Tab = Window:MakeTab({
	Name = "墨水游戏",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton ({--这个就相当于一个按钮
	Name = "复制脚本汉化",
	Callback = function ()
	setclipboard("loadstring(game:HttpGet("https://raw.githubusercontent.com/Xingtaiduan/Script/refs/heads/main/Games/墨水游戏.lua"))()")
	 OrionLib:MakeNotification({
                    Name = "信息",
                    Content = "复制请在粘贴板中查看",
                    Time = 2
                })
	end
})