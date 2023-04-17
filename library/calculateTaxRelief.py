

def Calculate_Tax_Relief(variable, gender, salary, tax):

    if gender == 'male':
        gender_bonus = 0
    else:
        gender_bonus = 500

    tax_relief = ((salary - tax) * variable) + gender_bonus
    rounded_tax_relief = round(tax_relief, 2)
    if 0.00 < rounded_tax_relief < 50.00:
        return 50.00
    else:
        return rounded_tax_relief
