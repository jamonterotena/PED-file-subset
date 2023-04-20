child=$1
pedfilename=$2

sire=$(grep "$child" ${pedfilename}.ped| grep G3 | cut -f3 | head -n1)
dam=$(grep "$child" ${pedfilename}.ped| grep G3 | cut -f4 | head -n1)
sire_grandpa=$(grep "$sire" ${pedfilename}.ped| grep G2 | cut -f3 | head -n1)
sire_grandma=$(grep "$sire" ${pedfilename}.ped| grep G2 | cut -f4 | head -n1)
dam_grandpa=$(grep "$dam" ${pedfilename}.ped| grep G2 | cut -f3 | head -n1)
dam_grandma=$(grep "$dam" ${pedfilename}.ped| grep G2 | cut -f4 | head -n1)

(grep $sire_grandpa ${pedfilename}.ped| grep G1 | head -n1
grep $sire_grandma ${pedfilename}.ped| grep G1 | head -n1
grep $dam_grandpa ${pedfilename}.ped| grep G1 | head -n1
grep $dam_grandma ${pedfilename}.ped| grep G1 | head -n1
grep $sire ${pedfilename}.ped| grep G2 | head -n1
grep $dam ${pedfilename}.ped| grep G2 | head -n1
grep $child ${pedfilename}.ped| grep G3 | head -n1) >> ${child}.ped

cp ${pedfilename}.map ${child}.map
