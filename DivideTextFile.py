def process_and_split_file(file_path, parts):
    # Read and process lines from the input file
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = [line.lstrip('/') for line in file.readlines()]  # Remove '/' from the start

    total_lines = len(lines)
    lines_per_part = total_lines // parts
    extra = total_lines % parts  # For distributing remaining lines

    start = 0
    for i in range(parts):
        # Calculate end index considering extra lines
        end = start + lines_per_part + (1 if i < extra else 0)
        part_lines = lines[start:end]

        # Save each part into a new file
        part_file = f"{file_path}_part_{i+1}.txt"
        with open(part_file, 'w', encoding='utf-8') as part:
            part.writelines(part_lines)
        print(f"Part {i+1} saved to {part_file}")

        start = end

# Example usage
file_path = input("Enter the path of the text file: ")
parts = int(input("Enter the number of parts to split into: "))
process_and_split_file(file_path, parts)
