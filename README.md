# tec-Haptic

## Table of Contents
- [Overview](#overview)
- [Input Mechanisms](#input-mechanisms)
  - [Sensor-Based Input](#sensor-based-input)
  - [Detecting Finger Movements](#detecting-finger-movements)
- [Output Mechanisms](#output-mechanisms)
- [Example by Others](#example-by-others)
- [Convert to MINT](#convert-to-mint)

## Haptic Communication Interfaces for the TEC-1

### Overview
Haptic communication interfaces enable devices to communicate through touch-based feedback. This technology can provide sensory feedback about a system's status, confirm user interactions, or allow users to control a system through touch-sensitive input.

## Input Mechanisms
### Sensor-Based Input
The system collects input from various sensors placed on the body to detect different types of motion and interaction. Commonly used sensors include:

- **Motion Sensors** – Detects overall movement. For entry-level experimentation using an SBC running a Z80 with simple I/O, consider using a basic PIR (Passive Infrared) sensor for detecting motion, such as the HC-SR501, which is inexpensive and widely available for hobbyist use.. These sensors are easy to interface with digital inputs and provide a simple on/off signal. Alternatively, a mechanical tilt switch or reed switch can be used for basic motion detection without requiring complex signal processing.

- **Accelerometers** – Measures changes in velocity and direction. For entry-level experimentation with a Z80-based SBC, a low-cost MEMS accelerometer such as the ADXL345 can be interfaced via I2C or SPI for simple movement tracking.
  
- **Gyroscopes** – Tracks orientation and angular velocity. Consider using an MPU6050, which integrates both a gyroscope and an accelerometer, simplifying sensor fusion.
  
- **Magnetometers** – Detects magnetic field changes, useful for directional tracking. The HMC5883L is a commonly used module that provides digital compass capabilities.
  
- **Pressure Sensors** –  Measures applied force or touch intensity. Simple force-sensitive resistors (FSRs) can be used to detect pressure changes and provide an easy-to-read analog signal.
  
- **Skin Temperature Sensors** – Monitors changes in skin temperature. The MLX90614 infrared temperature sensor allows non-contact temperature readings, useful for wearable applications.
  

### Detecting Finger Movements
Finger movements can be detected using:

- **Variable Resistors (Flex Sensors)** – Flexible strips whose resistance changes with bending.
  - Example: [SparkFun Flex Sensor Guide](https://learn.sparkfun.com/tutorials/flex-sensor-hookup-guide/all)
  - Typical resistance: ~30kΩ unbent, ~70kΩ fully bent.
  - Used in voltage dividers with a reference resistor (e.g., 47kΩ) for signal stability.

- **Capacitive Sensors** – Custom-made by coiling insulated magnetic wire around a skewer at a helix pitch.
  - Once formed, dip in liquid latex to maintain shape.
  - When flexed, the capacitance varies, producing a signal convertible to frequency or voltage, which can be processed via an ADC.

## Output Mechanisms
Various output types provide haptic feedback, including:

- **Vibration** – Small motors or piezo actuators provide tactile feedback.
- **Pressure Feedback** – Mechanisms apply resistance or force feedback to simulate physical interaction.
- **Temperature Feedback** – Thermoelectric devices create heat or coolness for simulation.
- **Force Feedback** – Motors or resistance elements simulate pressure or resistance.

## Example by Others

The `FSensor.ino` file is an Arduino sketch for reading a **flex sensor** using a **voltage divider circuit**. Here’s a breakdown of its functionality:

### **Overview**
- This sketch is designed for **SparkFun's flex sensor** ([Product Link](https://www.sparkfun.com/products/10264)).
- It reads the **voltage output** from a voltage divider where the **flex sensor** and a **47kΩ resistor** are connected.
- As the flex sensor **bends**, its resistance **increases**, leading to a **decrease in voltage** at **A0**.

---

### **Convert to MINT**
```mint
// Define variables 
:A 0 a !         // Analog pin A0 for flex sensor input
:B 4980 b !      // VCC in millivolts (4.98V)  
:C 47500 c !     // Resistor value (47.5kΩ)

// Constants for angle calculation
:D 37300 d !     // Resistance when straight
:E 90000 e !     // Resistance at 90 degrees

// Setup function (runs once)  
:S /K ;          // Output to default terminal

// Main loop (runs continuously)
:L
  a /I f !                   // Read ADC value from A0   
  f b * 1023 / g !           // Convert ADC to voltage (mV)

  b g / 
  b * c *
  h !                        // Calculate resistance
      
  `Resistance: ` h . ` ohms` /N   // Print resistance
        
  h d - i !                  // Calculate bend angle  
  e d - * 90 / i + i !
        
  `Bend: ` i . ` degrees` /N /N   // Print angle

  500 ()                     // Delay 500ms      
  L                          // Loop forever
;
```

