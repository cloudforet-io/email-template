#! /bin/bash

# Template directory
dir=$(pwd)/template

# Find all template files
files=$(find "$dir" -type f)

# Change blog
for file in $files; do
  sed -i'' -e "s/blog.spaceone.megazone.io/BLOG.EXAMPLE.COM/g" "$file"
done

# Change help center
for file in $files; do
  sed -i'' -e "s/help.spaceone.megazone.com/HELP.EXAMPLE.COM/g" "$file"
done

# Change home page
for file in $files; do
  sed -i'' -e "s/spaceone.megazone.io/HOMEPAGE.EXAMPLE.COM/g" "$file"
done

# Change Header Image
for file in $files; do
  sed -i'' -e "s/img.stibee.com\/70522_1678432526.png/raw.githubusercontent.com\/cloudforet-io\/artwork\/main\/logo\/Cloudforet_logo--horizontal-color.png/g" "$file"
done

# Change Footer
for file in $files; do
  sed -i'' -e "s/Copyright 2023 © MEGAZONE CLOUD Corp./Copyright © 2024 Cloudforet Project./g" "$file"
done

cat > email-template.yaml << EOF
apiVersion: v1
kind: ConfigMap
metadata:
  name: email-template-configmap
data:
EOF

# Loop all files
for file in $files; do
  # basename
  filename=$(basename "$file")
  echo "  $filename: |-" >> email-template.yaml
  cat $file | sed 's/^/    /' >> email-template.yaml
done