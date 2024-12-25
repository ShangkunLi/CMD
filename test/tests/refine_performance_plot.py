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
    1.551569507,
    1.305623472,
    1.630188679,
    1.395348837,
    1.168604651,
    1.240601504,
    1.209090909,
    1.491612903,
    1.398753894,
    1.249937511,
    1.154761905,
]

# settings
bar_width = 0.1
index = np.arange(len(benchmarks))

# create a figure
fig = plt.figure(figsize=(12, 1.3))
ax1 = fig.add_subplot(111)
# plot the bars
bars_baseline = plt.bar(
    index + 0.2,
    baseline,
    bar_width,
    label="Baseline Speedup",
    edgecolor="black",
    color="#A9A9A9",
    # hatch=".",
)
bars_refine = plt.bar(
    index + 0.2 + bar_width + 0.03,
    cluster1,
    bar_width,
    label="Refined Speedup",
    edgecolor="black",
    color="#e86252",
    # hatch="//",
)

# Remove the top and right spines
# plt.gca().spines["top"].set_visible(False)
# plt.gca().spines["right"].set_visible(False)
plt.gca().spines["top"].set_linewidth(0.5)
plt.gca().spines["top"].set_color("black")
plt.gca().spines["top"].set_zorder(0)
plt.gca().spines["top"].set_linestyle((0, (5, 5)))
plt.gca().spines["right"].set_linewidth(1)
plt.gca().spines["right"].set_color("lightgray")
plt.gca().spines["right"].set_zorder(0)


# set the range of x and y axis
plt.ylim(0.8, 1.7)
plt.xlim(-0.24, 10.45)
# 添加轴标签和图例
plt.ylabel("Normalized Speedup", fontsize=12, fontproperties=font_props)
plt.yticks(
    [0.8, 1.0, 1.2, 1.4, 1.6],
    fontsize=12,
    fontproperties=font_props,
)
# Draw vertical lines for additional ticks between clusters
for i in [0.9, 1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6]:
    plt.axhline(y=i, color="black", linestyle=(0, (5, 5)), linewidth=0.5, zorder=0)

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
        0.65,
        label,
        ha="center",
        va="baseline",
        fontsize=12,
        fontproperties=font_props,
    )

# Create a twin Axes sharing the xaxis
ax2 = plt.gca().twinx()
ax2.spines["top"].set_visible(False)
# Secondary data for the line plot
baseline_efficiency = [
    0.294642857,
    0.38277512,
    0.272251309,
    0.299964998,
    0.403850037,
    0.349090909,
    0.307671005,
    0.302192564,
    0.346387885,
    0.270408163,
    0.291956431,
]
refine_efficiency = [
    0.392857143,
    0.432426297,
    0.440687446,
    0.321428571,
    0.484144275,
    0.428571429,
    0.416666667,
    0.340336842,
    0.509615385,
    0.319277108,
    0.386924863,
]

# Plot the line chart on the second y-axis
(lines_baseline,) = ax2.plot(
    index + 0.26,
    baseline_efficiency,
    linewidth=1.5,
    markeredgecolor="black",
    markeredgewidth=0.5,
    markersize=7,
    color="#75ad3d",
    marker="o",
    label="Baseline Computation Efficiency",
)
(lines_refined,) = ax2.plot(
    index + 0.26,
    refine_efficiency,
    linewidth=1.5,
    markeredgecolor="black",
    markeredgewidth=0.5,
    markersize=7,
    color="#f4c000",
    marker="s",
    label="Refined Computation Efficiency",
)
ax2.set_ylim(0, 0.6)  # Adjust the limits for the new y-axis
ax2.set_ylabel("Computation Efficiency", fontsize=12, fontproperties=font_props)

# Customize ticks on the second y-axis
ax2.tick_params(
    axis="y", length=10, width=1, labelsize=12, colors="black", direction="inout"
)
ax2.set_yticks([0, 0.2, 0.4, 0.6])
ax2.set_yticklabels(["0%", "20%", "40%", "60%"], fontsize=12, fontproperties=font_props)

lines = [lines_baseline, lines_refined]
line_labels = [l.get_label() for l in lines]
bars = [bars_baseline, bars_refine]
bar_labels = [b.get_label() for b in bars]

# plt.xticks(index, benchmarks, fontsize=12, fontproperties=font_props, rotation=45)
plt.legend(
    bars+lines,
    bar_labels+line_labels,
    loc="upper center",
    bbox_to_anchor=(0.5, 1.2),
    ncol=4,
    fontsize=16,
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
plt.savefig("refine_performance_evaluation.pdf", bbox_inches="tight")
