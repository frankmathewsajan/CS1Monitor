import serial
import json

SERIAL_PORT = 'COM4'  # Replace with your correct port
BAUD_RATE = 9600      # Match the ESP8266 baud rate

try:
    with serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=1) as ser:
        print(f"Listening on {SERIAL_PORT}...")
        while True:
            if ser.in_waiting > 0:
                raw_data = ser.readline()
                print(f"Raw data: {raw_data}")

                try:
                    # Decode and parse JSON
                    decoded_data = raw_data.decode('utf-8').strip()
                    print(f"Decoded: {decoded_data}")

                    data = json.loads(decoded_data)
                    print(f"Parsed JSON: {data}")

                    # Overwrite to a JSON file

                    with open("sensor_data.json", "w") as file:
                        json.dump(data, file)
                        file.write("\n")  # Add a newline after each JSON object

                except json.JSONDecodeError as e:
                    print(f"JSON Decode Error: {e}")
                except UnicodeDecodeError as e:
                    print(f"Decode Error: {e}")

except serial.SerialException as e:
    print(f"Serial Exception: {e}")
except Exception as e:
    print(f"Other Exception: {e}")