# tec-Haptic

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

## Code Implementation
looking at other ppl work

The `FSensor.ino` file is an Arduino sketch for reading a **flex sensor** using a **voltage divider circuit**. Here’s a breakdown of its functionality:

### **Overview**
- This sketch is designed for **SparkFun's flex sensor** ([Product Link](https://www.sparkfun.com/products/10264)).
- It reads the **voltage output** from a voltage divider where the **flex sensor** and a **47kΩ resistor** are connected.
- As the flex sensor **bends**, its resistance **increases**, leading to a **decrease in voltage** at **A0**.

---

### **Code Breakdown**
#### **1. Pin and Constant Declarations**
```cpp
const int FLEX_PIN = A0; // Pin connected to voltage divider output
const float VCC = 4.98; // Measured voltage of Arduino 5V line
const float R_DIV = 47500.0; // Measured resistance of 47kΩ resistor
```
- **`FLEX_PIN`**: Analog pin `A0` reads the sensor voltage.
- **`VCC`**: Actual voltage supplied to Arduino’s `5V` pin (measured for accuracy).
- **`R_DIV`**: The reference resistor value (`47kΩ` in this case).

#### **2. Reading Sensor Data**
```cpp
void setup() {
    Serial.begin(9600); // Start serial communication
}

void loop() {
    int flexADC = analogRead(FLEX_PIN); // Read sensor voltage
    float flexV = flexADC * VCC / 1023.0; // Convert ADC value to voltage
    float flexR = R_DIV * (VCC / flexV - 1.0); // Calculate flex sensor resistance
    
    Serial.print("Resistance: ");
    Serial.print(flexR);
    Serial.println(" ohms");

    delay(500);
}
```
- **`analogRead(FLEX_PIN)`**: Reads **analog voltage** from the sensor.
- **`flexV = flexADC * VCC / 1023.0`**: Converts ADC (0-1023) to actual **voltage**.
- **`flexR = R_DIV * (VCC / flexV - 1.0)`**: Uses the **voltage divider equation** to compute the flex sensor’s **resistance**.

#### **3. Output via Serial Monitor**
- The **sensor resistance** is printed to the **Serial Monitor** every `500ms`.

---

### **How It Works**
1. The **flex sensor** acts as a **variable resistor**.
2. When it is **straight**, its resistance is **low (~30kΩ)**, causing a **higher voltage** at `A0`.
3. When it is **bent**, its resistance **increases (~70kΩ+)**, leading to a **lower voltage** at `A0`.
4. The Arduino converts the voltage to resistance and prints it.

---

### **How to Use**
1. **Wiring**:
   - One end of the **flex sensor** goes to **A0 & 3.3V**.
   - A **47kΩ resistor** is connected between **A0 and GND**.
2. **Upload the code** to an Arduino.
3. Open **Serial Monitor (9600 baud)** to see the **sensor resistance change** as you bend it.




 

