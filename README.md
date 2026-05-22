# Self-balancing-robot-MATLAB
Self balancing robot using MATLAB / Simulink state space modeling, PID/LQR control, deploying on Aurdino Mega
## Weekly Progress
- [x] Week 1 — Theory & Modeling (Day 1-2 complete)
- [ ] Week 2 — Controller Design
...

## Results So Far
### Open Loop Analysis (Day 2)
- Unstable pole confirmed at +5.64
- System falls over in ~1.4 seconds without control
- Controllability rank = 4 ✅
- 
### Simulink(Day 3)
-built simulink model from scratch
-visualized open loop instability
-both position and angle confiremed unstable
-Simulink result matches MATLAB result

### PID (day 4)
-Build complete PID closed loop 
-tuned gains from scratch 
#### -angle settling at exactly  in 0.4 second
### LQR
-PID desinged and tuned
-final matrices [1,1,2000,10];
 ### chasis and MPU 6050 
 - Wired to Arduino Mega (3.3V, GND, SDA pin 20, SCL pin 21)
- Mounted on breadboard for stable connections
- Complementary filter implemented
- Angle readings verified: ~0.04° at rest
- Sensor responds correctly to tilt

- 2WD acrylic chassis assembled
- Both DC motors mounted with encoder discs
- Both wheels attached
- Battery holder mounted
- Standing vertically for self-balancing orientation

-  Arduino Mega 2560 REV3
- COM17 port configured
- IMU reader code uploaded successfully
