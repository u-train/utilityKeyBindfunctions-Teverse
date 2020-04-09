
local function bindKeyToPressed(keyName, functionOnPressed, functionOnRelease)
    --Make sure the function doesn't error because of missing table field; give best feedback.
    assert(keyName, "keyName argument is nil.")
    local enumKey = enums.key[keyName]
    
    assert(enumKey, "keyName is not a vaild argument.")
    assert(type(functionOnPressed) == "function", "functionOnPressed is not a vaild argument.")

    --functionOnRelease is an optional argument
    if functionOnRelease then
        assert(type(functionOnRelease) == "function", "functionOnRelease is not a vaild argument.")
     end

    onKeyPressConnection = engine.input:on("keyPressed", function(inputObject)
        if debounce then return end
        if inputObject.key == enumKey then
            debounce = true
    
            functionOnPressed(inputObject)
         end
    end)

    onKeyReleaseConnection = engine.input:on("keyReleased", function(inputObject)
        if not debounce then return end
        if inputObject.key == enumKey then
            debounce = false

            if functionOnRelease then
                functionOnRelease(inputObject)
            end
        end
    end)

    --Deconstructor
    return function()
        onKeyPressConnection:disconnect()
        onKeyPressConnection = nil
    
        onKeyReleaseConnection:disconnect()
        onKeyReleaseConnection = nil
    end
end

local function bindKeyToStepped(keyName, functionOnPressed, functionOnRelease)
    --Make sure the assert doesn't error because of missing table field.
    assert(keyName, "keyName argument is nil.")
    local enumKey = enums.key[keyName]
    
    assert(enumKey, "keyName is not a vaild argument.")
    assert(type(functionOnPressed) == "function", "functionOnPressed is not a vaild argument.")

    --functionOnRelease is an optional argument
    if functionOnRelease then
        assert(type(functionOnRelease) == "function", "functionOnRelease is not a vaild argument.")
    end
    
    local keyBindConnection
    local debounce = false
    
    onKeyPressConnection = engine.input:on("keyPressed", function(inputObject)
        if debounce then return end
        if inputObject.key == enumKey then
            debounce = true

            keyBindConnection = engine:on("stepped", functionOnPressed)
        end
    end)

    onKeyReleaseConnection = engine.input:on("keyReleased", function(inputObject)
        if not debounce then return end
        if inputObject.key == enumKey then
            debounce = false
            
            keyBindConnection:disconnect()
            keyBindConnection = nil

            if functionOnRelease then
                functionOnRelease()
            end
        end
    end)

    --Deconstructor
    return function()
        onKeyPressConnection:disconnect()
        onKeyPressConnection = nil

        onKeyReleaseConnection:disconnect()
        onKeyReleaseConnection = nil

        if keyBindConnection then
            keyBindConnection:disconnect()
        end
        keyBindConnection = nil
    end
end