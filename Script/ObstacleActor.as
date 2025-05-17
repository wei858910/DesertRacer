class AObstacleActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    UCapsuleComponent CapsuleComp;

    UPROPERTY(DefaultComponent)
    UPaperSpriteComponent ObstacleSprite;

    AMyGameMode MyGameMode;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        CapsuleComp.OnComponentBeginOverlap.AddUFunction(this, n"OverlapBegin");
        MyGameMode = Cast<AMyGameMode>(Gameplay::GetGameMode());
    }

    UFUNCTION()
    private void OverlapBegin(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        APlayerCharacter Player = Cast<APlayerCharacter>(OtherActor);
        if (IsValid(Player))
        {
            Player.bCanMove = false;
            if(IsValid(MyGameMode))
            {
                MyGameMode.ResetMyLevel(false);
            }
        }
    }
};