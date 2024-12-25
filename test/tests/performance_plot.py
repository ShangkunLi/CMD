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
baseline = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
cluster1 = [
    1.145695364,
    1.328358209,
    1.407166124,
    1.395348837,
    1.370454545,
    1.259541985,
    1.209090909,
    1.491612903,
    1.398753894,
    1.249975003,
    1.096045198,
]
cluster2 = [
    1.330769231,
    1.011363636,
    1.416393443,
    1.395348837,
    1.161849711,
    1.259541985,
    1.209090909,
    1.491612903,
    1.398753894,
    1.25,
    1.096045198,
]
cluster4 = [
    1.330769231,
    1.305623472,
    1.407166124,
    1.395348837,
    1.370454545,
    1.259541985,
    1.209090909,
    1.491612903,
    1.398753894,
    1.249950008,
    1.154761905,
]
cluster6 = [
    1.56561086,
    0.906621392,
    1.416393443,
    1.395348837,
    1.168604651,
    1.259541985,
    1.209090909,
    1.491612903,
    1.398753894,
    1.249925013,
    0.974874372,
]
# settings
bar_width = 0.1
index = np.arange(len(benchmarks))

# create a figure
plt.figure(figsize=(12, 1.3))
# plot the bars
plt.bar(
    index,
    baseline,
    bar_width,
    label="Baseline",
    edgecolor="black",
    color="#A9A9A9",
    # hatch=".",
)
plt.bar(
    index + bar_width + 0.03,
    cluster1,
    bar_width,
    label="Cluster Size = 1",
    edgecolor="black",
    color="#409cd8",
    # hatch="//",
)
plt.bar(
    index + 2 * bar_width + 0.03 * 2,
    cluster2,
    bar_width,
    label="Cluster Size = 2",
    edgecolor="black",
    color="#ffbd00",
    # hatch="..",
)
plt.bar(
    index + 3 * bar_width + 0.03 * 3,
    cluster4,
    bar_width,
    label="Cluster Size = 4",
    edgecolor="black",
    color="#bbe7bb",
    # hatch="--",
)
plt.bar(
    index + 4 * bar_width + 0.03 * 4,
    cluster6,
    bar_width,
    label="Cluster Size = 6",
    edgecolor="black",
    color="#ffeab0",
    # hatch="\\",
)

# Remove the top and right spines
# plt.gca().spines["top"].set_visible(False)
# plt.gca().spines["right"].set_visible(False)
plt.gca().spines["top"].set_linewidth(1)
plt.gca().spines["top"].set_color("black")
plt.gca().spines["top"].set_zorder(0)
plt.gca().spines["top"].set_linestyle((0,(5,5)))
plt.gca().spines["right"].set_linewidth(1)
plt.gca().spines["right"].set_color("lightgray")
plt.gca().spines["right"].set_zorder(0)


# set the range of x and y axis
plt.ylim(0.8, 1.6)
plt.xlim(-0.24, 10.45)
# 添加轴标签和图例
plt.ylabel("Normalized Speedup", fontsize=12, fontproperties=font_props)
plt.yticks([0.8,1.0,1.2,1.4,1.6], fontsize=12, fontproperties=font_props)
# Draw vertical lines for additional ticks between clusters
for i in [1.0,1.2,1.4]:
    plt.axhline(y=i , color="black", linestyle=(0,(5,5)), linewidth=1,zorder=0)

plt.xticks(index + 0.76,[],fontsize=12, fontproperties=font_props,zorder=1)
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
        pos +0.26,
        0.65,
        label,
        ha="center",
        va="baseline",
        fontsize=12,
        fontproperties=font_props,
    )

# plt.xticks(index, benchmarks, fontsize=12, fontproperties=font_props, rotation=45)
plt.legend(
    loc="upper center",
    bbox_to_anchor=(0.5, 1.2),
    ncol=5,
    fontsize=18,
    prop=font_props,
    borderaxespad=-0.5,
    handleheight=1,
    handlelength=1,
    columnspacing=6,
    handletextpad=1.2,
    fancybox=False,
    frameon=False,
)  

# save the figure
plt.savefig("performance_evaluation.pdf", bbox_inches="tight")
