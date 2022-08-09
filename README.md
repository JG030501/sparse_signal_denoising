# Interpretability and Generalization in Sparse Signal Denoising

## Abstract

Convolutional Neural Networks (CNNs) have recently gained increased recognition with signal denoising tasks, however there is little insight towards understanding their inner workings. The aim of our project is to understand what a Convolutional Neural Network learns during the training process of denoising a sparse signal, and hence improve its generalization and interpretability. We perform numerous experiments and are able to identify patterns in the filters, for example: time reversal, negation and scaling. This allows us to derive and impose constraints on CNNs. The resulting networks require less training and have increased performance as well as improved generalization. This result validates our understanding of what the CNNs learn and enhances the efficiency of sparse signal denoising.

## Denoised signals

## Filter plots

### Unconstrained CNN

![6x2_unconstrained](https://user-images.githubusercontent.com/88984657/183673685-c4b93b67-657d-4300-a60e-2a89f219e131.svg)

### Constrained CNN

![6x2_constrained](https://user-images.githubusercontent.com/88984657/183673804-54359960-f14a-4d4c-836b-e4106b517b0c.svg)

## Performance Analysis

### SNR vs Rho

![snr_rho_1](https://user-images.githubusercontent.com/88984657/183673201-820548c8-f6a4-41d6-8ded-374dc61771cd.svg)

### SNR vs Sigma

![snr_sigma (1)](https://user-images.githubusercontent.com/88984657/183673159-0f385d5b-e879-422b-920f-696c17530ce1.svg)
