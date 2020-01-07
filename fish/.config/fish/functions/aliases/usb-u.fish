function usb-u -d "Unmount usb via udisks2"
    udisksctl unmount -b $argv
end

