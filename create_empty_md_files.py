#!/usr/bin/env python3
"""
Script to create empty markdown files with only titles for CK3 wiki topics.
"""

import os
import re


def convert_to_snake_case(title):
    """Convert title to snake_case without the CK3 prefix."""
    # Remove 'CK3 ' prefix
    title = re.sub(r"^CK3\s+", "", title)
    # Replace spaces with underscores and convert to lowercase
    return title.lower().replace(" ", "_")


def main():
    # Path to the links file
    docs_file = "docs/guides/online_docs.md"
    output_dir = "docs/guides"

    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)

    # Read the links file
    with open(docs_file, "r", encoding="utf-8") as f:
        lines = f.readlines()

    # Process each line
    for line in lines:
        line = line.strip()
        if not line:  # Skip empty lines
            continue

        match = re.match(r"(.+) - (.+)", line)
        if match:
            title = match.group(1)

            # Convert title to snake_case filename
            filename = convert_to_snake_case(title)
            output_file = os.path.join(output_dir, f"{filename}.md")

            # Skip if it's the scripting.md reference file
            if filename == "scripting" and os.path.exists(output_file):
                print(f"Skipping {filename}.md as it already exists (reference file)")
                continue

            # Create markdown file with just the title
            with open(output_file, "w", encoding="utf-8") as f:
                f.write(f"# {title}\n")

            print(f"Created: {output_file}")

    print("Done!")


if __name__ == "__main__":
    main()
