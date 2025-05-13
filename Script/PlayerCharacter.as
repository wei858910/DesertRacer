class APlayerCharacter : APawn
{
    UPROPERTY(DefaultComponent, RootComponent)
    UCapsuleComponent CapsuleComp;
    default CapsuleComp.CapsuleHalfHeight = 170.f;
    default CapsuleComp.CapsuleRadius = 72.f;
    default CapsuleComp.SetCollisionProfileName(n"Pawn"); // 设置碰撞预设为"Pawn"，适用于角色类对象，会自动处理与场景和其他Actor的碰撞交互。

    UPROPERTY(DefaultComponent, Attach = CapsuleComp)
    USpringArmComponent SpringArm;
    default SpringArm.SetRelativeRotation(FRotator(0., -90., 0.));
    default SpringArm.bDoCollisionTest = false;

    UPROPERTY(DefaultComponent, Attach = SpringArm)
    UCameraComponent Camera;
    default Camera.SetProjectionMode(ECameraProjectionMode::Orthographic);
    default Camera.SetOrthoWidth(3000.);

    UPaperSprite CarSpriteSource = Cast<UPaperSprite>(LoadObject(nullptr, "/Game/Assets/Sprites/car_Sprite.car_Sprite"));

    UPROPERTY(DefaultComponent, Attach = CapsuleComp)
    UPaperSpriteComponent CarSprite;
    default CarSprite.SetSprite(CarSpriteSource);
    default CarSprite.SetRelativeScale3D(FVector(0.6, 0.6, 0.6));
    default CarSprite.SetCollisionProfileName(n"NoCollision");

    // 让 Player0（第一个本地玩家）的控制器自动 Possess（占据） 当前Actor，使其成为玩家控制的实体。
    default AutoPossessPlayer = EAutoReceiveInput::Player0;


    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
    }
};