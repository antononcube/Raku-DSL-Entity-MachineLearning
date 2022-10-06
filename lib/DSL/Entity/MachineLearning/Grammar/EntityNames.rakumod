use DSL::Entity::MachineLearning::ResourceAccess;
use DSL::Shared::Entity::Grammar::EntityNames;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

role DSL::Entity::MachineLearning::Grammar::EntityNames
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    # It is assumed that metadata types have only alpha-numeric characters.
    regex entity-classifier-property-name {
        ( [ << <word-value> >> ]+ % \h+ ) <?{ self.get-resources().known-name('ClassifierProperty', $0.Str.lc) }>
    }

    regex entity-classifier-name {
        ([<< <word-value> >>]+ % \h+) <?{ self.get-resources().known-name('Classifier', $0.Str.lc) }>
    }
}