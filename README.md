# Build-a-Salon-Appointment-Scheduler
A Bash script that allows users to book salon appointments, manage customer records, and schedule services using a PostgreSQL database. The script features service selection, customer management, and appointment confirmation with error handling.


# Approach

The **Salon Appointment Scheduler** was designed to be user-friendly, efficient, and straightforward, with a focus on managing appointments and customer records easily. Here’s a breakdown of how it works:

### 1. **Service Selection**
   When the script starts, users are shown a list of salon services, each with a number next to it (like "1) cut", "2) color", etc.). The user simply chooses the number corresponding to the service they want. If they accidentally pick a service that doesn’t exist (like typing a number not on the list), the script gently prompts them to choose again until they get it right.

### 2. **Customer Identification**
   Once the user selects a service, they are asked for their phone number. This is how the system identifies whether they are an existing customer. If the phone number is already in the database, it pulls up their name and moves on. If the number isn’t found, the script will ask for their name and save them as a new customer.

### 3. **Appointment Scheduling**
   After confirming the user’s identity, the script asks what time they’d like to schedule the appointment. Once the time is entered, the appointment is saved in the database, including the service, customer, and the chosen time.

### 4. **Appointment Confirmation**
   After the appointment is booked, the script gives the user a friendly confirmation message like, “I’ve put you down for a color at 2 PM, Jane.” This ensures the user knows their appointment details and feels confident everything was scheduled correctly.

### 5. **Error Handling**
   The script has been built to handle mistakes smoothly:
   - If the user picks an invalid service number, it doesn’t break the flow – it just asks them to try again.
   - If the phone number isn’t recognized, it prompts the user to create a new customer record, ensuring the process stays easy and clear.

### 6. **How the Database Works**
   Behind the scenes, the script interacts with a PostgreSQL database to keep track of three main things: `customers`, `services`, and `appointments`. It retrieves service options, looks up customers by phone number, and stores new customers and appointments. This keeps everything organized and easily accessible for future use.

### 7. **Room for Future Growth**
   The system is designed to be flexible, so it can be expanded later if needed. For example, it would be easy to add new services or even manage multiple salon locations by updating the database and script. This ensures the project can grow as needed without too much hassle.

### Summary
In short, the Salon Appointment Scheduler makes booking salon services easy and efficient. It guides users step-by-step through the process of picking a service, identifying themselves, and scheduling a time. With simple error handling and a well-organized database, the system works smoothly and can be expanded in the future if more features are needed.
