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
cluster1 = [13.71428571, 4, 13.71428571, 48, 19.2, 12, 13.71428571, 96, 96, 6.4, 4]
cluster2 = [6.857142857, 2, 6.857142857, 24, 9.6, 6, 6.857142857, 48, 48, 3.2, 2]
cluster4 = [3.428571429, 1, 3.428571429, 12, 4.8, 3, 3.428571429, 24, 24, 1.6, 1]
cluster6 = [
    2.285714286,
    0.666666667,
    2.285714286,
    8,
    3.2,
    2,
    2.285714286,
    16,
    16,
    1.066666667,
    0.666666667,
]

# settings
bar_width = 0.1
index = np.arange(len(benchmarks))

# create a figure
plt.figure(figsize=(12, 1.5))
# plot the bars
plt.bar(
    index + 0.065,
    cluster1,
    bar_width,
    label="Cluster Size = 1",
    edgecolor="black",
    color="#409cd8",
    # hatch=".",
)
plt.bar(
    index + 0.065 + bar_width + 0.03,
    cluster2,
    bar_width,
    label="Cluster Size = 2",
    edgecolor="black",
    color="#ffbd00",
    # hatch="//",
)
plt.bar(
    index + 0.065 + 2 * bar_width + 0.03 * 2,
    cluster4,
    bar_width,
    label="Cluster Size = 4",
    edgecolor="black",
    color="#bbe7bb",
    # hatch="..",
)
plt.bar(
    index + 0.065 + 3 * bar_width + 0.03 * 3,
    cluster6,
    bar_width,
    label="Cluster Size = 6",
    edgecolor="black",
    color="#ffeab0",
    # hatch="--",
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
plt.yscale("log")
plt.ylim(0, 100)
plt.xlim(-0.24, 10.45)
# 添加轴标签和图例
plt.ylabel("Memory Reduction", fontsize=12, fontproperties=font_props)
plt.yticks([1, 10, 100], fontsize=12, fontproperties=font_props)
# plt.gca().set_yticklabels(
#     ["0x", "20x", "40x", "60x", "80x", "100x"], fontproperties=font_props
# )
# Draw vertical lines for additional ticks between clusters
for i in [1, 10, 100]:
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
        0.18,
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
    columnspacing=9,
    handletextpad=1.2,
    fancybox=False,
    frameon=False,
)

# save the figure
plt.savefig("memory_size.pdf", bbox_inches="tight")
