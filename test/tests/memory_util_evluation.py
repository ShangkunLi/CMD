import numpy as np
import matplotlib.pyplot as plt


# set the font
font_path = "/usr/share/fonts/truetype/msttcorefonts/Times_New_Roman.ttf"
font_props = plt.matplotlib.font_manager.FontProperties(fname=font_path)

# 数据
benchmarks = [
    "gemm",
    "mm",
    "2mm",
    "trVecAccum",
    "gemver",
    "fft",
    "floyd_washall",
    "viterbi",
    "levmarq",
    "gcn",
    "cnn",
]
cluster1 = [
    0.083333333,
    0.222222222,
    0.166666667,
    0.027777778,
    0.583333333,
    0.416666667,
    0.111111111,
    0.222222222,
    0.055555556,
    0.416666667,
    0.777777778,
]
cluster2 = [
    0.222222222,
    0.444444444,
    0.277777778,
    0.055555556,
    0.888888889,
    0.833333333,
    0.222222222,
    0.388888889,
    0.111111111,
    0.666666667,
    0.944444444,
]
cluster4 = [
    0.444444444,
    0.777777778,
    0.555555556,
    0.111111111,
    0.888888889,
    0.888888889,
    0.444444444,
    0.666666667,
    0.222222222,
    0.888888889,
    1,
]
cluster6 = [0.5, 1, 0.666666667, 0.166666667, 1, 1, 0.5, 0.666666667, 0.333333333, 1, 1]
refinement = [
    0.5,
    0.888888889,
    0.833333333,
    0.166666667,
    1,
    1,
    0.5,
    0.666666667,
    0.333333333,
    0.888888889,
    1,
]
# settings
bar_width = 0.1
index = np.arange(len(benchmarks))

# create a figure
plt.figure(figsize=(12, 1.5))
# plot the bars
plt.bar(
    index,
    cluster1,
    bar_width,
    label="Cluster Size = 1",
    edgecolor="black",
    color="#409cd8",
    # hatch=".",
)
plt.bar(
    index + bar_width + 0.03,
    cluster2,
    bar_width,
    label="Cluster Size = 2",
    edgecolor="black",
    color="#ffbd00",
    # hatch="//",
)
plt.bar(
    index + 2 * bar_width + 0.03 * 2,
    cluster4,
    bar_width,
    label="Cluster Size = 4",
    edgecolor="black",
    color="#bbe7bb",
    # hatch="..",
)
plt.bar(
    index + 3 * bar_width + 0.03 * 3,
    cluster6,
    bar_width,
    label="Cluster Size = 6",
    edgecolor="black",
    color="#ffeab0"
    # hatch="--",
)
plt.bar(
    index + 4 * bar_width + 0.03 * 4,
    refinement,
    bar_width,
    label="Refined Architecture",
    edgecolor="black",
    color="#e86252",
    # hatch="\\",
)

# Remove the top and right spines
# plt.gca().spines["top"].set_visible(False)
# plt.gca().spines["right"].set_visible(False)
plt.gca().spines["top"].set_linewidth(1)
plt.gca().spines["top"].set_color("black")
plt.gca().spines["top"].set_zorder(0)
plt.gca().spines["top"].set_linestyle((0, (5, 5)))
plt.gca().spines["right"].set_linewidth(1)
plt.gca().spines["right"].set_color("lightgray")
plt.gca().spines["right"].set_zorder(0)


# set the range of x and y axis
plt.ylim(0, 1)
plt.xlim(-0.24, 10.45)
# 添加轴标签和图例
plt.ylabel("Memory Utilization", fontsize=12, fontproperties=font_props)
plt.yticks([0, 0.2, 0.4, 0.6, 0.8,1.0], fontsize=12, fontproperties=font_props)
plt.gca().set_yticklabels(["0%", "20%", "40%", "60%", "80%", "100%"], fontproperties=font_props)
# Draw vertical lines for additional ticks between clusters
for i in [0.2, 0.4, 0.6, 0.8]:
    plt.axhline(y=i, color="black", linestyle=(0, (5, 5)), linewidth=1, zorder=0)

plt.xticks(index + 0.76, [], fontsize=12, fontproperties=font_props, zorder=1)
# Draw vertical lines for additional ticks between clusters
for i in index:
    plt.axvline(x=i + 0.76, color="lightgray", linestyle="-", linewidth=1, zorder=0)

# Customize ticks
plt.tick_params(
    axis="x", length=10, width=1, color="black", direction="inout", labelsize=12
)
plt.tick_params(
    axis="y", length=10, width=1, color="black", direction="inout", labelsize=12
)

# Add custom X-axis labels at fixed positions
for pos, label in zip(index, benchmarks):
    plt.text(
        pos + 0.26,
        -0.2,
        label,
        ha="center",
        va="baseline",
        fontsize=12,
        fontproperties=font_props,
    )

# plt.xticks(index, benchmarks, fontsize=12, fontproperties=font_props, rotation=45)
plt.legend(
    loc="upper center",
    bbox_to_anchor=(0.5, 1.15),
    ncol=5,
    fontsize=18,
    prop=font_props,
    borderaxespad=-0.5,
    handleheight=1,
    handlelength=1,
    columnspacing=5,
    handletextpad=1.2,
    fancybox=False,
    frameon=False,
)

# save the figure
plt.savefig("memory_util.pdf", bbox_inches="tight")
