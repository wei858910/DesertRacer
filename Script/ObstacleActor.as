class AObstacleActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    UCapsuleComponent CapsuleComp;

    UPROPERTY(DefaultComponent)
    UPaperSpriteComponent ObstacleSprite;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
    }
};