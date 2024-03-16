import os


# Define the output directory
os.makedirs(os.getenv("OUTPUT_DIR", ""), exist_ok=True)

# Define the output file path
output_file_path = os.path.join(os.getenv("OUTPUT_DIR", ""), "output.txt")

# Write "Hello, World!" to the output file
with open(output_file_path, "w") as f:
    f.write("Hello, World!\n")

print("Output file created successfully at:", output_file_path)