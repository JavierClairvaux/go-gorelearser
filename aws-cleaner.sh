declare -a array
for i in {0..4}; do
    array[$i]="$(date +%F -d "-$i days")"
done

aws s3 rm s3://sputnik-releases/Nigthly/ --dryrun --exclude "${array[0]}-*" \
  --exclude "${array[1]}-*" \
  --exclude "${array[2]}-*" \
  --exclude "${array[3]}-*" \
  --exclude "${array[4]}-*" \
  --recursive
