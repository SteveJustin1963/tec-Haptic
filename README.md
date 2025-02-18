# tec-Haptic

## Haptic Communication Interfaces for the TEC-1

### Overview
Haptic communication interfaces enable devices to communicate through touch-based feedback. This technology can provide sensory feedback about a system's status, confirm user interactions, or allow users to control a system through touch-sensitive input.

## Input Mechanisms
### Sensor-Based Input
The system collects input from various sensors placed on the body to detect different types of motion and interaction. Commonly used sensors include:

- **Motion Sensors** – Detects overall movement. For entry-level experimentation using an SBC running a Z80 with simple I/O, consider using a basic PIR (Passive Infrared) sensor for detecting motion. These sensors are easy to interface with digital inputs and provide a simple on/off signal. Alternatively, a mechanical tilt switch or reed switch can be used for basic motion detection without requiring complex signal processing.

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
(Code to be included in the repository.)

## Further Development
### Related Projects
- [tec-Gesture](https://github.com/SteveJustin1963/tec-Gesture)

### References
- (Add relevant references and documentation sources here.)

