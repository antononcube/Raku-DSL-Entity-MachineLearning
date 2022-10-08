use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Utilities::MetaSpecsProcessing;
use DSL::Shared::Entity::ResourceAccess;

class DSL::Entity::MachineLearning::ResourceAccess
        is DSL::Shared::Entity::ResourceAccess {
    #-----------------------------------------------------------
    # OVERRIDE-START
    #-----------------------------------------------------------

    #| Override the parent class function in order to call
    #| DSL::Shared::Entity::ResourceAccess.make()
    #| with the correct file names.
    method get-resource-files(--> Hash) {
        #        my @fileNames = <Classifier ClassifierMeasurement ClassifierProperty ROCFunction>;
        #        my %resources = @fileNames Z=> @fileNames.map({ $_ ~  'NameToEntityID_EN.csv' });
        #        %resources = %resources.map({ $_.key => %?RESOURCES{$_.value} });
        #        return %resources;

        # English
        my @fileNames = <Classifier ClassifierMeasurement ClassifierProperty ROCFunction>;
        my %fileNames1 = @fileNames.map({ $_ => $_ ~ 'NameToEntityID_EN.csv' });
        my %resources = %fileNames1 .map({ $_.key => %?RESOURCES{$_.value} });

        # Bulgarian
        %fileNames1 = @fileNames.map({ $_ => $_ ~ 'NameToEntityID_BG.csv' });
        my %resources-bg = %fileNames1.map({ $_.key ~ '-Bulgarian' => %?RESOURCES{$_.value} });

        # Combine
        %resources = %resources, %resources-bg;
        return %resources;
    }

    #-----------------------------------------------------------
    # OVERRIDE-END
    #-----------------------------------------------------------


    ##========================================================
    ## Access
    ##========================================================

    #-----------------------------------------------------------
    method classifier-to-id(Str:D $class, Str:D $phrase, Bool :$warn = False) {

    }

    #-----------------------------------------------------------
    method classifier-property-to-id(Str:D $class, Str:D $phrase, Bool :$warn = False) {

    }

}
