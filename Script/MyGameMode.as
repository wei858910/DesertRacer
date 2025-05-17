class AMyGameMode : AGameModeBase
{
    UClass PawnClass = Cast<UClass>(LoadObject(nullptr, "/Game/BP/BP_PlayerCharacter.BP_PlayerCharacter_C"));
    default DefaultPawnClass = PawnClass;

    UPROPERTY()
    float LoseResetTime = 1.;

    UPROPERTY()
    float WinResetTime = 3.;

    UFUNCTION(BlueprintOverride)
    void BeginPlay()
    {
        UMyGameInstance MyGameInstance = Cast<UMyGameInstance>(GetGameInstance());
        if(IsValid(MyGameInstance))
        {
            MyGameInstance.PlayBGMusic();
        }
    }

    UFUNCTION()
    void ResetMyLevel(bool bIsWin)
    {
        float ResetTime = LoseResetTime;
        if (bIsWin)
        {
            ResetTime = WinResetTime;
        }

        System::SetTimer(this, n"OnResetGameTimeout", ResetTime, false);
    }

    UFUNCTION()
    void OnResetGameTimeout()
    {
        Gameplay::OpenLevel(n"MainLevel");
    }
};