declare -a array
for i in {0..4}; do
    array[$i]="$(date +%F -d "-$i days")"
done

aws s3 mv s3://sputnik-releases/Nigthly/${array[0]}/  s3://sputnik-releases/backup/${array[0]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/Nigthly/${array[1]}/  s3://sputnik-releases/backup/${array[1]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/Nigthly/${array[2]}/  s3://sputnik-releases/backup/${array[2]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/Nigthly/${array[3]}/  s3://sputnik-releases/backup/${array[3]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/Nigthly/${array[4]}/  s3://sputnik-releases/backup/${array[4]}/ --recursive --quiet

aws s3 rm s3://sputnik-releases/Nigthly/ --recursive --quiet

aws s3 mv s3://sputnik-releases/backup/${array[0]}/ s3://sputnik-releases/Nigthly/${array[0]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/backup/${array[1]}/ s3://sputnik-releases/Nigthly/${array[1]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/backup/${array[2]}/ s3://sputnik-releases/Nigthly/${array[2]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/backup/${array[3]}/ s3://sputnik-releases/Nigthly/${array[3]}/ --recursive --quiet
aws s3 mv s3://sputnik-releases/backup/${array[4]}/ s3://sputnik-releases/Nigthly/${array[4]}/ --recursive --quiet

aws s3 rm s3://sputnik-releases/backup/ --recursive --quiet
