#!/usr/bin/env python3

import argparse
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def manhattan_plot(infile: str, outfile: str):
    """
    Creates a manhattan plot from a formatted .assoc file
    Input
    --------
    infile : str
        .assoc.logistic file
    outfile : str
        output matplotlib image
    """

    # Reading in data
    df = pd.read_csv(infile)
    df = df.dropna()
    df.CHR = df.CHR.astype('category')
    df = df.sort_values('CHR')
    df.CHR = df.apply(lambda x: f'chr {x.CHR}', axis=1)

    # -log_10 transformation
    df['negLogP'] = -np.log10(df.P)

    # Creating new index
    df['ind'] = range(len(df))
    df_grouped = df.groupby(('CHR'))

    # Figure
    fig = plt.figure(figsize=(15, 10))
    ax = fig.add_subplot(111)
    colors = ['#8b0000', '#ff3030', '#ffb5c5', '#cd6600', '#ff8c00', '#ffa54f', '#cd9b1d', '#ffd700', '#f0e68c', '#006400', '#228b22', '#adff2f', '#00008b', '#1e90ff', '#87ceeb', '#483d8b', '#6959cd', '#ab82ff', '#68228b', '#cd69c9', '#dda0dd', '#d02090', '#4f4f4f', '#000000']

    # Plots
    x_labels = []
    x_labels_pos = []
    for num, (name, group) in enumerate(df_grouped):
        group.plot(kind='scatter', x='ind', y='negLogP', color=colors[num % len(colors)], ax=ax, edgecolors= "black", linewidth=0.5)
        x_labels.append(name)
        x_labels_pos.append((group['ind'].iloc[-1] - (group['ind'].iloc[-1] - group['ind'].iloc[0])/2))


    # Labels
    ax.set_xlabel('Chromosome', fontsize=28)
    ax.set_ylabel('-log10(P)', fontsize=28)

    # Ticks
    plt.xticks(x_labels_pos, x_labels, fontsize=18, rotation=90)
    plt.yticks(fontsize=18)

    # Limits
    ax.set_xlim([0, len(df)])
    ax.set_ylim(0)

    # Lines
    ax.hlines(-np.log10(5e-8), 0, len(df), color='black', linewidth=4)

    # Saving
    fig.savefig(outfile)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-i', '--infile', help="Assoc file", required=True)
    parser.add_argument('-o', '--outfile', help="Output file of image", required=True)

    args = parser.parse_args()
    manhattan_plot(args.infile, args.outfile)
