
local detailedGeometry = ModelGeometry()

local params = Style.GetParameterValues()

local LEG_HEIGHT = params.Legs.legsHeight
local LEG_OFFSET = params.Legs.legsOffset
local LEG_SIDE_SIZE = params.Legs.legsSideSize

local BORDERS_HEIGHT = params.Borders.bordersHeight
local BORDERS_WIDTH = params.Borders.bordersWidth

local PANEL_HORIZONTAL_ANGLE = params.General.panelHorizontalAngle

-- Размеры 
local BASE_SIZE = {
    X = 1250,
    Y = 600,
    Z = 25,
}



do -- тело панели + бортики

    local basePart = CreateBlock(BASE_SIZE.X, BASE_SIZE.Y, BASE_SIZE.Z)
    basePart:Shift(0, 0, LEG_HEIGHT)

    local parts = {
        basePart,
    }

    -- Правый и левый бортики
    for i = 1, 2, 1 do
        local sign = i % 2 == 0 and -1 or 1

        local border = CreateBlock(BASE_SIZE.X, BORDERS_WIDTH, BASE_SIZE.Z + BORDERS_HEIGHT)
        border:Shift(0, sign * BASE_SIZE.Y / 2, LEG_HEIGHT)

        table.insert(parts, border)
    end


    -- Верхний и нижний бортики
    for i = 1, 2, 1 do
        local sign = i % 2 == 0 and -1 or 1

        local border = CreateBlock(BORDERS_WIDTH, BASE_SIZE.Y, BASE_SIZE.Z + BORDERS_HEIGHT)
        border:Shift(sign * BASE_SIZE.X / 2, 0, LEG_HEIGHT)

        table.insert(parts, border)
    end

    local union = Unite(parts)
    union:Rotate(
        CreateXAxis3D(),
        math.rad(PANEL_HORIZONTAL_ANGLE)
    )
    detailedGeometry:AddSolid(union)
end

do -- Сетчатое покрытие панели
    local planarGeometry = GeometrySet2D()
    local placement = Placement3D(
        Point3D(0, 0, LEG_HEIGHT + BASE_SIZE.Z), 
        Vector3D(0, 0, 1), 
        Vector3D(0, 0, 0)
    ):Rotate(
        CreateXAxis3D(), 
        math.rad(PANEL_HORIZONTAL_ANGLE)
    )

    for i = -BASE_SIZE.Y / 2, BASE_SIZE.Y / 2, 50 do
        planarGeometry:AddCurve(
            CreateLineSegment2D(
                Point2D(-BASE_SIZE.X / 2, i), 
                Point2D(BASE_SIZE.X / 2, i)
            )
        )
    end

    for i = -BASE_SIZE.X / 2, BASE_SIZE.X / 2, 50 do
        planarGeometry:AddCurve(
            CreateLineSegment2D(
                Point2D(i, -BASE_SIZE.Y / 2), 
                Point2D(i, BASE_SIZE.Y / 2)
            )
        )
    end

    detailedGeometry:AddGeometrySet2D(planarGeometry, placement)
end

do -- Ножки
    for i = 1, 4, 1 do
        local xSign = i % 2 ~= 0 and 1 or -1
        local ySign = i < 3 and -1 or 1

        local height = LEG_HEIGHT
        local zOffset = BASE_SIZE.Y * math.sin(math.rad(PANEL_HORIZONTAL_ANGLE))
        local yOffset = BASE_SIZE.Y * math.cos(math.rad(PANEL_HORIZONTAL_ANGLE / 1.375))

        if ySign == -1 then
            height = math.max(height, zOffset)
        else
            height = math.max(height, height * 2 * math.sin(PANEL_HORIZONTAL_ANGLE))
        end

        local leg = CreateBlock(
            LEG_SIDE_SIZE, 
            LEG_SIDE_SIZE, 
            height
        )
        leg:Shift(
            xSign * BASE_SIZE.X / 2 - xSign * LEG_OFFSET, 
            ySign * BASE_SIZE.Y / 2 - ySign * yOffset + ySign * LEG_OFFSET, 
            math.min(-(zOffset) / 2 + LEG_HEIGHT, 0)
        )

        detailedGeometry:AddSolid(leg)
    end
end

Style.SetDetailedGeometry(detailedGeometry)