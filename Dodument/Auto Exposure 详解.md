# 虚幻引擎 Auto Exposure 详解

## 1. 基本概念
**Auto Exposure（自动曝光）** 是虚幻引擎中的动态后处理效果，用于模拟人眼/摄像机对光照环境的自适应能力。

## 2. 核心作用
- ✅ **动态亮度平衡**
  - 亮部防过曝（如阳光场景）
  - 暗部提细节（如洞穴场景）
- ✅ **真实感增强**
  - 模拟人眼瞳孔调节
  - 实现明暗过渡效果

## 3. 关键参数（Post Process Volume）
| 参数 | 类型 | 默认值 | 说明 |
|------|------|--------|------|
| Min Brightness | float | 1 | 最小曝光值 |
| Max Brightness | float | 2 | 最大曝光值 |
| Exposure Compensation | float | 0 | 曝光补偿（±值调整） |
| Speed Up | float | 3 | 暗→亮适应速度 |
| Speed Down | float | 1 | 亮→暗适应速度 |
| Histogram Mode | Enum | Auto | 测光模式（平均/中央重点） |

## 4. 使用场景

    A[室内外转换] --> B[自动亮度过渡]
    C[写实风格游戏] --> D[眼适应效果]
    E[过场动画] --> F[曝光补偿控制]