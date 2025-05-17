class AObstacleActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    UCapsuleComponent CapsuleComp;

    UPROPERTY(DefaultComponent)
    UPaperSpriteComponent ObstacleSprite;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        CapsuleComp.OnComponentBeginOverlap.AddUFunction(this, n"OverlapBegin");
    }

    UFUNCTION()
    private void OverlapBegin(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        APlayerCharacter Player = Cast<APlayerCharacter>(OtherActor);
        if (IsValid(Player))
        {
            Player.bCanMove = false;
        }
    }
};