'use babel';

const { CompositeDisposable, File } = require('atom');
const config = require('./config-schema.json');
const provider = require('./provider');

module.exports = {
  /**
   * @type {File}
   */
  pkg: null,

  /**
   * @type {object}
   */
  config,

  /**
   * @type {CompositeDisposable}
   */
  subscriptions: null,

  /**
   * Bootstrap and activate the package.
   *
   * @return {void}
   */
  activate () {
    this.subscriptions = new CompositeDisposable();

    this.pkg = new File(atom.project.resolvePath('./package.json'));

    if (!this.isDisabledIfNotInPackageJson()) {
      provider.isTailwindProject = true;
    } else if (this.pkg.existsSync()) {
      this.isTailwindListedAsDependency();

      this.subscriptions.add(this.pkg.onDidChange(this.handleDidChange.bind(this)));
      this.subscriptions.add(this.pkg.onDidDelete(this.handleDidDelete.bind(this)));
    } else {
      this.subscriptions.add(atom.project.onDidChangeFiles(this.handleDidChangeFiles.bind(this)));
    }

    this.subscriptions.add(atom.config.onDidChange('atom-tailwindcss.isDisabledIfNotInPackageJson', this.handleDidChangeConfig.bind(this)));
  },

  /**
   * Check if tailwindcss is listed as a dependency in the package.json file.
   *
   * @return {void}
   */
  handleDidChange () {
    this.isTailwindListedAsDependency();
  },

  /**
   * Stop autocompletion when package.json file is removed.
   *
   * @return {void}
   */
  handleDidDelete () {
    provider.isTailwindProject = false;
  },

  /**
   * Check if the package.json file was created or renamed to package.json.
   *
   * @param {object} events
   *
   * @return {void}
   */
  handleDidChangeFiles (events) {
    for (const event of events) {
      if (event.path !== this.pkg.path) {
        continue;
      }

      if (event.action === 'renamed' || event.action === 'created') {
        this.isTailwindListedAsDependency();
      }
    }
  },

  /**
   * Check if the package always should autocomplete.
   *
   * @param {object} event
   *
   * @return {void}
   */
  handleDidChangeConfig ({ newValue }) {
    if (newValue === false) {
      provider.isTailwindProject = true;
    } else {
      this.isTailwindListedAsDependency();
    }
  },

  /**
   * Validate tailwindcss package dependency.
   *
   * @return {void}
   */
  async isTailwindListedAsDependency () {
    try {
      const pkg = await this.pkg.read();

      const { dependencies, devDependencies } = JSON.parse(pkg);

      const packages = Object.assign(dependencies, devDependencies);

      provider.isTailwindProject = 'tailwindcss' in packages;
      return Promise.resolve();
    } catch (error) {
      provider.isTailwindProject = false;
      return Promise.resolve();
    }
  },

  /**
   * Dispose and deactivate the package.
   *
   * @return {bool}
   */
  isDisabledIfNotInPackageJson () {
    return atom.config.get('atom-tailwindcss.isDisabledIfNotInPackageJson');
  },

  /**
   * Return the completion provider.
   *
   * @return {object}
   */
  getProvider () {
    return provider;
  },

  /**
   * Dispose and deactivate the package.
   *
   * @return {void}
   */
  deactivate () {
    if (this.subscriptions) {
      this.subscriptions.dispose();
    }

    this.subscriptions = null;
  }
};
