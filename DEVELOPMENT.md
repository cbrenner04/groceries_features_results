# Results Dashboard Development Guidelines

This document outlines the development standards, patterns, and guardrails for the test results dashboard application.

## Technology Stack

- **Framework:** Ruby on Rails
- **Database:** SQLite (development), PostgreSQL (production)
- **Authentication:** Devise
- **Frontend:** ERB templates with Bootstrap
- **Testing:** RSpec
- **Asset Pipeline:** Sprockets

## Application Purpose

The results dashboard application serves as a monitoring and reporting tool for the feature test suite. It provides:

- Test run results visualization
- Feature test status tracking
- Performance metrics
- Historical test data analysis

## Code Style & Patterns

### Rails Conventions

- Follow Rails conventions for file naming and structure
- Use snake_case for methods and variables
- Use CamelCase for classes and modules
- Use proper indentation (2 spaces)
- Use RESTful routing patterns

### Model Patterns

- Use proper associations between models
- Use validations for data integrity
- Use scopes for common queries
- Use callbacks appropriately
- Use proper naming conventions

### Controller Patterns

- Use proper HTTP status codes
- Use strong parameters for data validation
- Use proper error handling
- Use JSON responses for API endpoints
- Use proper authorization checks

## Database Design

### Models

- **Feature:** Represents a feature being tested
- **Result:** Represents individual test results
- **TestRun:** Represents a complete test run
- **User:** Represents dashboard users

### Associations

```ruby
class Feature < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :test_runs, through: :results
end

class Result < ApplicationRecord
  belongs_to :feature
  belongs_to :test_run
end

class TestRun < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :features, through: :results
end
```

## API Design

### Endpoints

- `GET /api/features` - List all features
- `GET /api/features/:id` - Get feature details
- `GET /api/results` - List test results
- `GET /api/test_runs` - List test runs
- `POST /api/results` - Create new test result

### Response Format

- Use consistent JSON response format
- Include proper error messages
- Use appropriate HTTP status codes
- Include pagination for large datasets

## Testing Standards

### RSpec Configuration

- Use RSpec for all testing
- Use FactoryBot for test data
- Use proper test isolation
- Use database transactions

### Test Structure

```
spec/
├── controllers/           # Controller specs
├── models/               # Model specs
├── features/             # Feature specs
└── factories/            # FactoryBot factories
```

## Development Workflow

### Scripts

```bash
bundle install               # Install dependencies
rails server                 # Start development server
rspec                        # Run tests
rails console                # Start Rails console
rails db:migrate             # Run database migrations
```

### Environment Setup

- Use proper environment variables
- Use database configuration for different environments
- Use proper logging configuration
- Use proper error handling

## Data Integration

### Feature Test Integration

- Receive test results from feature test suite
- Process and store test data
- Provide real-time status updates
- Generate performance reports

### Data Processing

- Parse test result data
- Calculate performance metrics
- Generate trend analysis
- Store historical data

## User Interface

### Dashboard Views

- **Home:** Overview of recent test runs
- **Features:** List of all features with status
- **Results:** Detailed test results
- **Test Runs:** Historical test run data

### UI Components

- Use Bootstrap for styling
- Use responsive design
- Use proper accessibility features
- Use consistent navigation

## Performance Considerations

### Database Optimization

- Use proper indexes
- Use efficient queries
- Use database views for complex data
- Use proper caching strategies

### Data Retention

- Implement data retention policies
- Archive old test results
- Clean up temporary data
- Optimize storage usage

## Security

### Authentication

- Use Devise for user authentication
- Implement proper authorization
- Use secure session management
- Protect sensitive data

### Data Protection

- Validate all input data
- Use proper parameter filtering
- Implement rate limiting
- Use secure headers

## Monitoring and Logging

### Application Monitoring

- Use proper logging
- Monitor application performance
- Track error rates
- Monitor database performance

### Error Handling

- Use proper exception handling
- Log errors appropriately
- Provide user-friendly error messages
- Implement error reporting

## Important Notes & Gotchas

- Test results are received asynchronously
- Data processing should be efficient
- Historical data can be large
- Real-time updates require proper caching
- Database performance is critical for large datasets

## Code Review Checklist

- [ ] Rails conventions followed
- [ ] Proper error handling implemented
- [ ] Tests written for new functionality
- [ ] Database queries are optimized
- [ ] Security considerations addressed
- [ ] Performance considerations addressed
- [ ] UI is responsive and accessible

## Common Patterns

### Controller Pattern

```ruby
class Api::FeaturesController < ApplicationController
  def index
    features = Feature.includes(:results).all
    render json: features
  end

  def show
    feature = Feature.find(params[:id])
    render json: feature
  end

  private

  def feature_params
    params.require(:feature).permit(:name, :description)
  end
end
```

### Model Pattern

```ruby
class Feature < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :test_runs, through: :results

  validates :name, presence: true
  validates :description, length: { maximum: 500 }

  scope :active, -> { where(active: true) }
  scope :recent, -> { order(created_at: :desc) }

  def success_rate
    return 0 if results.empty?
    (results.successful.count.to_f / results.count * 100).round(2)
  end
end
```

### View Pattern

```erb
<div class="feature-card">
  <h3><%= feature.name %></h3>
  <p><%= feature.description %></p>
  <div class="metrics">
    <span class="success-rate"><%= feature.success_rate %>%</span>
    <span class="total-runs"><%= feature.results.count %></span>
  </div>
</div>
```

This document should be updated as the results dashboard application evolves and new patterns emerge. 