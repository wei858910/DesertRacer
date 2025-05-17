class AObstacleActor : AActor
{
    UPROPERTY(DefaultComponent, RootComponent)
    UCapsuleComponent CapsuleComp;

    UPROPERTY(DefaultComponent)
    UPaperSpriteComponent ObstacleSprite;

    UPROPERTY()
    USoundBase HitSound;

    AMyGameMode MyGameMode;

    UPROPERTY()
    bool bIsFinishLine = false;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        CapsuleComp.OnComponentBeginOverlap.AddUFunction(this, n"OverlapBegin");
        MyGameMode = Cast<AMyGameMode>(Gameplay::GetGameMode());
    }

    UFUNCTION()
    private void OverlapBegin(UPrimitiveComponent OverlappedComponent, AActor OtherActor, UPrimitiveComponent OtherComp, int OtherBodyIndex, bool bFromSweep, const FHitResult&in SweepResult)
    {
        Gameplay::PlaySound2D(HitSound);

        APlayerCharacter Player = Cast<APlayerCharacter>(OtherActor);
        if (IsValid(Player))
        {
            if (IsValid(MyGameMode))
            {
                if (bIsFinishLine)
                {
                    MyGameMode.ResetMyLevel(true);
                }
                else
                {
                    Player.bCanMove = false;
                    MyGameMode.ResetMyLevel(false);
                }
            }
        }
    }
};