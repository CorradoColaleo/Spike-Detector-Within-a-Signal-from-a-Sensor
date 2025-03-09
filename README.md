# Spike-Detector-Within-a-Signal-from-a-Sensor

# Project Overview

This project implements a spike detection system within a signal received from a sensor. The system is structured into three main modules:

- IIR (Infinite Impulse Response) Filter: Used to attenuate noise in the incoming signal.

- Emphasis Block: Enhances the signal spikes for better detection.

- Detector: Identifies and flags spikes based on predefined thresholds.

The project is implemented using SystemVerilog and includes both frontend and backend design stages.

Features

Digital Filtering: Low-pass IIR filtering to remove high-frequency noise.

Spike Enhancement: Uses ASO (Adaptive Spike Operator) and Hamming window FIR filter.

Real-Time Spike Detection: Compares the signal with a dynamic threshold to identify spikes.