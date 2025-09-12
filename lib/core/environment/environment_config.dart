/// [EnvironmentConfig] is an abstract class that represents
/// the environment configuration
abstract class EnvironmentConfig {}

/// [DevEnvironmentConfig] is a class that represents
/// the development environment configuration
class DevEnvironmentConfig implements EnvironmentConfig {}

/// [ProdEnvironmentConfig] is a class that represents
/// the production environment configuration
class ProdEnvironmentConfig implements EnvironmentConfig {}

/// [StgEnvironmentConfig] is a class that represents
/// the staging environment configuration
class StgEnvironmentConfig implements EnvironmentConfig {}
