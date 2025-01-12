Admin Dashboard Demo

## Overview
This project is built using the **Robot Framework** with the **Selenium Library** for web automation. It is designed with a modular structure to ensure ease of use, scalability, and maintainability.

---

## Project Structure
### **1. Config**
- Centralized management of main configurations such as:
  - Environment (e.g., Testing, Staging, Production).
  - Browser types (e.g., Chrome, Firefox).

### **2. Test Data**
- Stores environment-specific test data in **YAML** files for modular and reusable data handling.

### **3. Tests**
- Contains test cases categorized by specific modules.

### **4. URLs**
- Stores URLs for different environments.

### **5. Resources**
- Contains reusable components, including:
  - **1. Keywords** directory for page-specific object management.
  - **2. Hooks**
    Manages pre-suite and post-suite operations.
    Handles framework initialization and termination.
  - **3. Driver Factory** Manages driver instances and configurations for different browsers.


## Libraries and Dependencies
The following libraries and their versions are used in this project:

- **Core Libraries:**
  - `robotframework==6.1.1`
  - `robotframework-assertion-engine==3.0.3`
  - `robotframework-pythonlibcore==4.4.1`
  - `robotframework-seleniumlibrary`
  - `robotframework-stacktrace==0.4.1`
- **Execution Utilities:**
  - `robotframework-pabot==2.16.0` (for parallel execution)
  - `robotframework-retryfailed==0.2.0` (for retrying failed tests)
- **Data Handling:**
  - `PyYAML`
  - `robotframework-excellib==2.0.1`
- **Browser Automation:**
  - `selenium==4.25.0`

All dependencies are listed in the `requirements.txt` file. To install them, run:
```bash
pip install -r requirements.txt
```

---

## Execution Commands

### **Parallel Execution**
```bash
pabot --processes 2 -i AddAttendeeORLogin -v Environment:Testing Tests/
```

### **Sequential Execution**
```bash
robot -i AddAttendee -v Environment:Testing Tests/
```

### **Environment Configuration**
Specify the desired environment using:
```bash
-v Environment:<Environment>
```

---

## Additional Information
- All details related to the project structure, tools, and configurations are provided in this document.
- For further assistance, feel free to reach out to the project maintainer.

---

