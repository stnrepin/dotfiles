function usb-m -d "Mount usb via udisks2"
    udisksctl mount -b $argv
end

