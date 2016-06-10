function available -a utility -d "Check if a function or command is available"
    if command -s -- "$utility" > /dev/null
        return
    end

    if functions -q -- "$utility"
        return
    end

    switch "$utility"
        case (builtin -n)
        
        case \*
            return 1
    end
end
