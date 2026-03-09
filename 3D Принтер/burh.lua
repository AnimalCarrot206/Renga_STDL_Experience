
local detailedGeometry = ModelGeometry()

local params = Style.GetParameterValues().Legs
local LEGS_HEIGHT = params.legsHeight
local LEGS_OFFSET = params.legsOffset

local EDGE_LENGTH = 500
local WALLS_THICKNESS = 12.5
local SIDE_STICK_WIDTH = 75

local LEG_SIZE = {
    X = 30,
    Y = 30,
    Z = LEGS_HEIGHT,
}

do -- Дно принтера
    local bottomPart = CreateBlock(EDGE_LENGTH, EDGE_LENGTH, WALLS_THICKNESS)
    bottomPart:Shift(0, 0, LEGS_HEIGHT)

    detailedGeometry:AddSolid(bottomPart)
end
do -- Передняя стенка
    local leftPart = CreateBlock(SIDE_STICK_WIDTH, WALLS_THICKNESS, EDGE_LENGTH)
    leftPart:Shift(
        -EDGE_LENGTH / 2 + SIDE_STICK_WIDTH / 2, 
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        LEGS_HEIGHT
    )

    local rightPart = CreateBlock(SIDE_STICK_WIDTH, WALLS_THICKNESS, EDGE_LENGTH)
    rightPart:Shift(
        EDGE_LENGTH / 2 - SIDE_STICK_WIDTH / 2, 
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        LEGS_HEIGHT
    )

    local upPart = CreateBlock(EDGE_LENGTH, WALLS_THICKNESS, SIDE_STICK_WIDTH)
    upPart:Shift(
        0, 
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        EDGE_LENGTH + LEGS_HEIGHT - SIDE_STICK_WIDTH
    )

    local downPart = CreateBlock(EDGE_LENGTH, WALLS_THICKNESS, SIDE_STICK_WIDTH)
    downPart:Shift(
        0, 
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        LEGS_HEIGHT
    )
    
    detailedGeometry:AddSolid(leftPart)
    detailedGeometry:AddSolid(rightPart)
    detailedGeometry:AddSolid(upPart)
    detailedGeometry:AddSolid(downPart)
end
do -- Задняя стенка
    local leftPart = CreateBlock(SIDE_STICK_WIDTH, WALLS_THICKNESS, EDGE_LENGTH)
    leftPart:Shift(
        -EDGE_LENGTH / 2 + SIDE_STICK_WIDTH / 2, 
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        LEGS_HEIGHT
    )

    local rightPart = CreateBlock(SIDE_STICK_WIDTH, WALLS_THICKNESS, EDGE_LENGTH)
    rightPart:Shift(
        EDGE_LENGTH / 2 - SIDE_STICK_WIDTH / 2, 
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        LEGS_HEIGHT
    )

    local upPart = CreateBlock(EDGE_LENGTH, WALLS_THICKNESS, SIDE_STICK_WIDTH)
    upPart:Shift(
        0, 
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        EDGE_LENGTH + LEGS_HEIGHT - SIDE_STICK_WIDTH
    )

    local downPart = CreateBlock(EDGE_LENGTH, WALLS_THICKNESS, SIDE_STICK_WIDTH)
    downPart:Shift(
        0, 
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        LEGS_HEIGHT
    )
    
    detailedGeometry:AddSolid(leftPart)
    detailedGeometry:AddSolid(rightPart)
    detailedGeometry:AddSolid(upPart)
    detailedGeometry:AddSolid(downPart)

    -- Эффект стекла
    local planarGeometry = GeometrySet2D()
    local placement = Placement3D(Point3D(0, EDGE_LENGTH / 2, EDGE_LENGTH / 2), Vector3D(0, 1, 0), Vector3D(1, 0, 0))

    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-100, -100), Point2D(100, 100)))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-100, 0), Point2D(0, 100)))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(0, -100), Point2D(100, 0)))

    detailedGeometry:AddGeometrySet2D(planarGeometry, placement)
end
do -- Правая стенка
    local leftPart = CreateBlock(WALLS_THICKNESS, SIDE_STICK_WIDTH, EDGE_LENGTH)
    leftPart:Shift(
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        -EDGE_LENGTH / 2 + SIDE_STICK_WIDTH / 2, 
        LEGS_HEIGHT
    )

    local rightPart = CreateBlock(WALLS_THICKNESS, SIDE_STICK_WIDTH, EDGE_LENGTH)
    rightPart:Shift(
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        EDGE_LENGTH / 2 - SIDE_STICK_WIDTH / 2, 
        LEGS_HEIGHT
    )

    local upPart = CreateBlock(WALLS_THICKNESS, EDGE_LENGTH, SIDE_STICK_WIDTH)
    upPart:Shift(
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        0, 
        EDGE_LENGTH + LEGS_HEIGHT - SIDE_STICK_WIDTH
    )

    local downPart = CreateBlock(WALLS_THICKNESS, EDGE_LENGTH, SIDE_STICK_WIDTH)
    downPart:Shift(
        EDGE_LENGTH / 2 - WALLS_THICKNESS / 2, 
        0, 
        LEGS_HEIGHT
    )
    
    detailedGeometry:AddSolid(leftPart)
    detailedGeometry:AddSolid(rightPart)
    detailedGeometry:AddSolid(upPart)
    detailedGeometry:AddSolid(downPart)

    -- Эффект стекла
    local planarGeometry = GeometrySet2D()
    local placement = Placement3D(Point3D(EDGE_LENGTH / 2, 0, EDGE_LENGTH / 2), Vector3D(1, 0, 0), Vector3D(0, 1, 0))

    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-125, -125), Point2D(-25, -25)))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-125, -75), Point2D(-75, -25)))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-75, -125), Point2D(-25, -75)))

    detailedGeometry:AddGeometrySet2D(planarGeometry, placement)
end
do -- Левая стенка
    local leftPart = CreateBlock(WALLS_THICKNESS, SIDE_STICK_WIDTH, EDGE_LENGTH)
    leftPart:Shift(
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        -EDGE_LENGTH / 2 + SIDE_STICK_WIDTH / 2, 
        LEGS_HEIGHT
    )

    local rightPart = CreateBlock(WALLS_THICKNESS, SIDE_STICK_WIDTH, EDGE_LENGTH)
    rightPart:Shift(
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        EDGE_LENGTH / 2 - SIDE_STICK_WIDTH / 2, 
        LEGS_HEIGHT
    )

    local upPart = CreateBlock(WALLS_THICKNESS, EDGE_LENGTH, SIDE_STICK_WIDTH)
    upPart:Shift(
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        0, 
        EDGE_LENGTH + LEGS_HEIGHT - SIDE_STICK_WIDTH
    )

    local downPart = CreateBlock(WALLS_THICKNESS, EDGE_LENGTH, SIDE_STICK_WIDTH)
    downPart:Shift(
        -EDGE_LENGTH / 2 + WALLS_THICKNESS / 2, 
        0, 
        LEGS_HEIGHT
    )
    
    detailedGeometry:AddSolid(leftPart)
    detailedGeometry:AddSolid(rightPart)
    detailedGeometry:AddSolid(upPart)
    detailedGeometry:AddSolid(downPart)

    local planarGeometry = GeometrySet2D()
    local placement = Placement3D(Point3D(-EDGE_LENGTH / 2, 0, EDGE_LENGTH / 2), Vector3D(1, 0, 0), Vector3D(0, 1, 0))

    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-125, -125), Point2D(-25, -25)))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-125, -75), Point2D(-75, -25)))
    planarGeometry:AddCurve(CreateLineSegment2D(Point2D(-75, -125), Point2D(-25, -75)))

    detailedGeometry:AddGeometrySet2D(planarGeometry, placement)
end
do -- Потолок
    local leftPart = CreateBlock(SIDE_STICK_WIDTH, EDGE_LENGTH, WALLS_THICKNESS)
    leftPart:Shift(
        -EDGE_LENGTH / 2 + SIDE_STICK_WIDTH / 2, 
        0, 
        EDGE_LENGTH + LEGS_HEIGHT - WALLS_THICKNESS
    )

    local rightPart = CreateBlock(SIDE_STICK_WIDTH, EDGE_LENGTH, WALLS_THICKNESS)
    rightPart:Shift(
        EDGE_LENGTH / 2 - SIDE_STICK_WIDTH / 2, 
        0, 
        EDGE_LENGTH + LEGS_HEIGHT - WALLS_THICKNESS
    )

    local upPart = CreateBlock(EDGE_LENGTH, SIDE_STICK_WIDTH, WALLS_THICKNESS)
    upPart:Shift(
        0, 
        -EDGE_LENGTH / 2 + SIDE_STICK_WIDTH / 2, 
        EDGE_LENGTH + LEGS_HEIGHT - WALLS_THICKNESS
    )

    local downPart = CreateBlock(EDGE_LENGTH, SIDE_STICK_WIDTH, WALLS_THICKNESS)
    downPart:Shift(
        0, 
        EDGE_LENGTH / 2 - SIDE_STICK_WIDTH / 2, 
        EDGE_LENGTH + LEGS_HEIGHT - WALLS_THICKNESS
    )
    
    -- Выпуклая стеклянная крышка
    local N = 75 -- Отступ по высоте от дна до выпуклости (по оси Z)
    local profiles = {
        CreateRectangle2D(Point2D(0, 0), 0, EDGE_LENGTH - 2 * SIDE_STICK_WIDTH, EDGE_LENGTH - 2 * SIDE_STICK_WIDTH),
        CreateRectangle2D(Point2D(0, 0), 0, 150, 150),
    }
    local placements = {
        Placement3D(
            Point3D(0, 0, EDGE_LENGTH + LEGS_HEIGHT),
            Vector3D(0, 0, 1),
            Vector3D(1, 0, 0)
        ),
        Placement3D(
            Point3D(0, 0, EDGE_LENGTH + LEGS_HEIGHT - WALLS_THICKNESS + N),
            Vector3D(0, 0, 1),
            Vector3D(1, 0, 0)
        ),
    }
    local loftedSolid = Loft(profiles, placements)

    detailedGeometry:AddSolid(leftPart)
    detailedGeometry:AddSolid(rightPart)
    detailedGeometry:AddSolid(upPart)
    detailedGeometry:AddSolid(downPart)
    detailedGeometry:AddSolid(loftedSolid)
end

do -- Катушки с проволкой (клеем) по бокам
    local RADIUS = EDGE_LENGTH / 5
    local CYLINDER_HEIGHT = WALLS_THICKNESS * 4
    local CYLINDER_OFFSET_FROM_WALL = 15

    for i = 1, 2, 1 do
        local sign = i % 2 ~= 0 and -1 or 1

        local cylinder = CreateRightCircularCylinder(RADIUS, CYLINDER_HEIGHT)
        cylinder:Rotate(CreateYAxis3D(), sign * math.pi / 2)
        cylinder:Shift(
            sign * EDGE_LENGTH / 2 + sign * CYLINDER_OFFSET_FROM_WALL,
            EDGE_LENGTH / 8,
            EDGE_LENGTH - RADIUS * 2
        )

        local smallCylinderForNegate = CreateRightCircularCylinder(RADIUS * 0.15, CYLINDER_HEIGHT)
        smallCylinderForNegate:Rotate(CreateYAxis3D(), sign * math.pi / 2)
        smallCylinderForNegate:Shift(
            sign * EDGE_LENGTH / 2 + sign * CYLINDER_OFFSET_FROM_WALL,
            EDGE_LENGTH / 8,
            EDGE_LENGTH - RADIUS * 2
        )

        local cylinderWithHole = Subtract(cylinder, smallCylinderForNegate)
        local biggerCylinderWithHole = cylinderWithHole:Clone()
        biggerCylinderWithHole:Scale(
            Point3D(
                sign * EDGE_LENGTH / 2 + sign * CYLINDER_OFFSET_FROM_WALL,
                EDGE_LENGTH / 8,
                EDGE_LENGTH - RADIUS * 2
            ), 
            0.75, 
            1.25, 
            1.25
        )
        biggerCylinderWithHole:Shift(sign * CYLINDER_HEIGHT * 0.25 / 2, 0, 0)

        detailedGeometry:AddSolid(Subtract(cylinderWithHole, biggerCylinderWithHole))
    end

    -- Держатели катушек
    for i = 1, 2, 1 do
        local sign = i % 2 ~= 0 and -1 or 1

        local partA = CreateBlock(CYLINDER_OFFSET_FROM_WALL, CYLINDER_OFFSET_FROM_WALL, EDGE_LENGTH / 3)
        partA:Shift(
            sign * EDGE_LENGTH / 2 + sign * CYLINDER_OFFSET_FROM_WALL / 2, 
            EDGE_LENGTH / 8, 
            EDGE_LENGTH / 2
        )

        local partB = CreateBlock(EDGE_LENGTH / 10, CYLINDER_OFFSET_FROM_WALL, RADIUS * 0.125)
        partB:Shift(
            sign * EDGE_LENGTH / 2 + sign * EDGE_LENGTH / 10,
            EDGE_LENGTH / 8,
            EDGE_LENGTH - RADIUS * 2
        )

        local partC = CreateBlock(WALLS_THICKNESS, WALLS_THICKNESS, WALLS_THICKNESS * 2)
        partC:Shift(
            sign * EDGE_LENGTH / 2 + sign * EDGE_LENGTH / 10 + sign * CYLINDER_HEIGHT / 2,
            EDGE_LENGTH / 8,
            EDGE_LENGTH - RADIUS * 2
        )

        detailedGeometry:AddSolid(partA)
        detailedGeometry:AddSolid(partB)
        detailedGeometry:AddSolid(partC)
    end
end

do -- Технические детали
    -- Болты по которым платформа ездит вверх/вниз
    local MAX_PLATFROM_HEIGHT = EDGE_LENGTH * 0.8 -- Высота предела подъема платформы
    local BOLTS_OFFSET_FROM_WALLS = 50 -- Отступ болтов от стенки
    local BOLTS_RADIUS = 5

    local leftBolt = CreateRightCircularCylinder(BOLTS_RADIUS, MAX_PLATFROM_HEIGHT)
    leftBolt:Shift(-EDGE_LENGTH / 2 + BOLTS_OFFSET_FROM_WALLS, 0, LEGS_HEIGHT)
    local rightBolt = CreateRightCircularCylinder(BOLTS_RADIUS, MAX_PLATFROM_HEIGHT)
    rightBolt:Shift(EDGE_LENGTH / 2 - BOLTS_OFFSET_FROM_WALLS, 0, LEGS_HEIGHT)

    detailedGeometry:AddSolid(leftBolt)
    detailedGeometry:AddSolid(rightBolt)

    -- Платформа
    local platformUp = CreateBlock(MAX_PLATFROM_HEIGHT, MAX_PLATFROM_HEIGHT, WALLS_THICKNESS)
    platformUp:Shift(0, 0, MAX_PLATFROM_HEIGHT * 0.8)

    detailedGeometry:AddSolid(platformUp)

    do -- Верхние детали поддержки (название деталей описано при перспективе вниз)
        local DETAIL_SIZE = {
            X = EDGE_LENGTH * 0.2,
            Y = EDGE_LENGTH * 0.75,
            Z = WALLS_THICKNESS * 2,
        }
        local DETAIL_OFFSET_FROM_WALL = 15

        local leftDetail = CreateBlock(DETAIL_SIZE.X, DETAIL_SIZE.Y, DETAIL_SIZE.Z)
        leftDetail:Shift(-EDGE_LENGTH / 2 + DETAIL_SIZE.X / 2 + DETAIL_OFFSET_FROM_WALL, 0, MAX_PLATFROM_HEIGHT * 0.925)

        local rightDetail = CreateBlock(DETAIL_SIZE.X, DETAIL_SIZE.Y, DETAIL_SIZE.Z)
        rightDetail:Shift(EDGE_LENGTH / 2 - DETAIL_SIZE.X / 2 - DETAIL_OFFSET_FROM_WALL, 0, MAX_PLATFROM_HEIGHT * 0.925)

        local upDetail = CreateBlock(DETAIL_SIZE.X, DETAIL_SIZE.Y, DETAIL_SIZE.Z)
        upDetail:Rotate(CreateZAxis3D(), math.pi / 2)
        upDetail:Shift(0, EDGE_LENGTH / 2 - DETAIL_SIZE.X / 2 - DETAIL_OFFSET_FROM_WALL, MAX_PLATFROM_HEIGHT * 0.975)

        local downDetail = CreateBlock(DETAIL_SIZE.X, DETAIL_SIZE.Y, DETAIL_SIZE.Z)
        downDetail:Rotate(CreateZAxis3D(), math.pi / 2)
        downDetail:Shift(0, -EDGE_LENGTH / 2 + DETAIL_SIZE.X / 2 + DETAIL_OFFSET_FROM_WALL, MAX_PLATFROM_HEIGHT * 0.975)

        detailedGeometry:AddSolid(leftDetail)
        detailedGeometry:AddSolid(rightDetail)
        detailedGeometry:AddSolid(upDetail)
        detailedGeometry:AddSolid(downDetail)
    end
end

do -- Ножки
    for i = 1, 4, 1 do
        local xSign = i % 2 ~= 0 and 1 or -1
        local ySign = i < 3 and -1 or 1

        local leg = CreateBlock(LEG_SIZE.X, LEG_SIZE.Y, LEG_SIZE.Z)
        leg:Shift(xSign * EDGE_LENGTH / 2 - xSign * LEGS_OFFSET, ySign * EDGE_LENGTH / 2 - ySign * LEGS_OFFSET, 0)

        detailedGeometry:AddSolid(leg)
    end
end


Style.SetDetailedGeometry(detailedGeometry)