# FPGA Gray Code Counter

An gray code counter written in Verilog meant to run on FPGAs/CPLDs. The purpose is to test logic analyzers, they should see transitions between sequential values of gray code, ideally without any jitter on the transitioning bit (under ideal test conditions).

## Supported FPGA Boards

* [TinyFPGA BX](https://tinyfpga.com/) featuring a Lattice iCE40LP8K
* [MicroNova Mercury 2](https://www.micro-nova.com/mercury-2) featuring a Xilinx Artix-7 XC7A35T)

### TinyFPGA BX

You must first set up `apio` and `tinyprog` following TinyFPGA's documentation:

[TinyFPGA BX User Guide](https://tinyfpga.com/bx/guide.html)

Then you can build and upload the project to the board:

```
apio build
apio upload
```

The TinyFPGA goes into bootloader mode by default when powered up while connected to a computer (USB host). You may need to run the following command to make it continue onto the user code:

```
tinyprog -b
```

### Expected Output

Here is a screenshot of using a "Mini 16" USB Logic analyzer to observe the gray code on the pins of the FPGA:

![Logic_Analyzer_1MHz_8-bit_Gray_Code_Capture](https://user-images.githubusercontent.com/1173876/114875938-6db9aa80-9dc3-11eb-9652-8b18dfbbaa70.png)

The "Mini 16" is a clone of the [Saleae Logic 16](https://www.adafruit.com/product/733), and compatible with their [legacy Logic v1.x software](https://support.saleae.com/logic-software/legacy-software/older-software-releases).
