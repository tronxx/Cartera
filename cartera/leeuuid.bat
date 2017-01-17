# $Id: checklist,v 1.7 2003/08/15 19:40:37 tom Exp $
if [ -z $DISPLAY ]
   then
   : ${DIALOG=dialog}
   else
   : ${DIALOG=Xdialog}
fi

: ${DIALOG_OK=0}
: ${DIALOG_CANCEL=1}
: ${DIALOG_ESC=255}

tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --title 'Seleccione el archivo' --fselect $1 20 60 2> $tempfile

if [ ! -d ~/config ]; then
   mkdir ~/config
fi

retval=$?

choice=`cat $tempfile`
case $retval in
  $DIALOG_OK)
    echo python /programas/lib/obtenuuid.py $choice >$2
    python /programas/lib/obtenuuid.py $choice >$2
    $DIALOG --title 'Uuid del Archivo es:' --msgbox $(cat $2) 23, 70
    ;;
  $DIALOG_CANCEL)
    echo "Cancel pressed.";;
  $DIALOG_ESC)
    echo "ESC pressed.";;
  *)
    echo "Unexpected return code: $retval (ok would be $DIALOG_OK)";;
esac
