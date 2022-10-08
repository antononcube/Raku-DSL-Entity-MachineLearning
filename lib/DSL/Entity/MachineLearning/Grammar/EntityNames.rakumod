use DSL::Entity::MachineLearning::ResourceAccess;
use DSL::Shared::Entity::Grammar::EntityNames;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

role DSL::Entity::MachineLearning::Grammar::EntityNames
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    # It is assumed that metadata types have only alpha-numeric characters.

    #------------------------------------------------------
    proto regex entity-classifier-name {*}

    regex entity-classifier-name:sym<English> {
        ([<< <word-value> >>]+ % \h+) <?{ self.get-resources().known-name('Classifier', $0.Str.lc) }>
    }

    regex entity-classifier-name:sym<Bulgarian> {
        ([<< <word-value> >>]+ % \h+) <?{ self.get-resources().known-name('Classifier-Bulgarian', $0.Str.lc) }>
    }

    #------------------------------------------------------
    proto regex entity-classifier-measurement-name {*}

    regex entity-classifier-measurement-name:sym<English> {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ClassifierMeasurement', $0.Str.lc) }>
    }

    regex entity-classifier-measurement-name:sym<Bulgarian> {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ClassifierMeasurement-Bulgarian', $0.Str.lc) }>
    }

    #------------------------------------------------------
    proto regex entity-classifier-property-name {*}

    regex entity-classifier-property-name:sym<English> {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ClassifierProperty', $0.Str.lc) }>
    }

    regex entity-classifier-property-name:sym<Bulgarian> {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ClassifierProperty-Bulgarian', $0.Str.lc) }>
    }

    #------------------------------------------------------
    proto regex entity-roc-function-name {*}

    regex entity-roc-function-name:sym<English> {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ROCFunction', $0.Str.lc) }>
    }

    regex entity-roc-function-name:sym<Bulgarian> {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ROCFunction-Bulgarian', $0.Str.lc) }>
    }
}