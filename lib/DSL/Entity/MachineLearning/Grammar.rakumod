use DSL::Shared::Entity::Grammar::EntityNames;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::ErrorHandling;
use DSL::Entity::MachineLearning::ResourceAccess;
use DSL::Entity::MachineLearning::Grammar::EntityNames;

grammar DSL::Entity::MachineLearning::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::Entity::MachineLearning::Grammar::EntityNames
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    my DSL::Entity::MachineLearning::ResourceAccess $resources;

    method get-resources(--> DSL::Entity::MachineLearning::ResourceAccess) { return $resources; }
    method set-resources(DSL::Entity::MachineLearning::ResourceAccess $obj) { $resources = $obj; }

    # TOP
    regex TOP {
        | <pipeline-command>
        | <classifier-measurement-entity-command>
        | <classifier-property-entity-command>
        | <classifier-entity-command>
        | <roc-function-entity-command>
    }

    regex machine-learning-entity-command {
        | <classifier-measurement-entity-command>
        | <classifier-property-entity-command>
        | <classifier-entity-command>
        | <roc-function-entity-command>
    }

    regex classifier-measurement-entity-command { <entity-classifier-measurement-name> }

    regex classifier-property-entity-command { <entity-classifier-property-name> }

    regex classifier-entity-command { <entity-classifier-name> }

    regex roc-function-entity-command { <entity-roc-function-name> }
}

