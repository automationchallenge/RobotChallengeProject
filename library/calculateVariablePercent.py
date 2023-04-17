from datetime import date


def Calculate_Variable_Percent(dob):
    today = date.today()
    age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))
    if int(age) in range(0, 18):
        return 1
    elif int(age) in range(18, 35):
        return 0.8
    elif int(age) in range(35, 50):
        return 0.5
    elif int(age) in range(50, 70):
        return 0.367
    else:
        return 0.05
