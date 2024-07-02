import random
import string


def remove_currency(price_str):
    #price_str = "$49.99"
    price_float = float(price_str.replace("$", ""))
    print(price_float)
    return price_float


# class CustomLibrary:
#     def create_objects(self, number_of_objects):
#         # Initialize the base structure
#         data_structure = {"mastervalue": []}
        
#         # Generate the specified number of objects
#         for i in range(1, number_of_objects + 1):
#             obj = {"key1": f"Parent {i}"}
#             data_structure["mastervalue"].append(obj)
        
#         # Return the generated data structure
#         return data_structure





def create_objects_for_other_field_api(number_of_objects):

    int_number_of_objects=int(number_of_objects)    
    master_value_objects = {"mastervalue": []}
        
    # Generate the specified number of objects
    for i in range(1, int_number_of_objects + 1):
        random_string = ''.join(random.choice(string.ascii_lowercase) for _ in range(5))
        obj = {"key1": random_string}
        master_value_objects["mastervalue"].append(obj)
        
    return master_value_objects



x=create_objects_for_other_field_api(2)
print(x)
    